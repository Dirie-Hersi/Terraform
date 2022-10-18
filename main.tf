module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-project-vpc"
  cidr = var.vpc_cidr

  azs             = var.azs
  private_subnets = var.private_sb
  public_subnets  = var.public_sb


  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

resource "aws_ecs_cluster" "my_ecs" {
  name = "my_ecs"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_ecs_cluster_capacity_providers" "my_ecs_cap" {
  cluster_name = aws_ecs_cluster.my_ecs.name

  capacity_providers = ["FARGATE"]

  default_capacity_provider_strategy {
    capacity_provider = "FARGATE"
  }
}

module "ecs-fargate" {
  source  = "umotif-public/ecs-fargate/aws"
  version = "~> 6.1.0"

  name_prefix        = "my-ecs-project"
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnets
  cluster_id         = aws_ecs_cluster.my_ecs.id

  task_container_image   = var.centos_image
  task_definition_cpu    = 256
  task_definition_memory = 512

  task_container_port             = 80
  task_container_assign_public_ip = true
  load_balanced                   = false

  target_groups = [
    {
      target_group_name = "tg-fargate"
      container_port    = 80
    }
  ]

  health_check = {
    port = "traffic-port"
    path = "/"
  }

  tags = {
    Environment = "test"
    Project     = "Test"
  }
}