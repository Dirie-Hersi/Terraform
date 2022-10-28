#---ec2/main.tf---

resource "random_integer" "random"{
    min = 1
    max = 100
}

resource "aws_instance" "app_server" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "ExampleAppServerInstance_${random_integer.random.id}"
  }
}