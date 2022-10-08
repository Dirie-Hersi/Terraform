terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.34.0"
    }
  }
}

provider "aws" {
    region = "us-east-1"
}

#VPC
resource "aws_vpc" "Terraformvpc" {
  cidr_block = "10.0.0.0/16"
  
  tags  = {
    Name = "Project_VPC"
  }
}


#Internet Gateway
resource "aws_internet_gateway" "Terraform IGW" {
  vpc_id = aws_vpc.Terraformvpc.id

  tags = {
    Name = "Terraform IGW"
  }
}


#Route Table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.Terraformvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Terraformvpc.id
  }

  tags = {
    Name = "PublicRT"
  }
}


#Public Subnet 1
resource "aws_subnet" "Public1A" {
  vpc_id     = aws_vpc.Terraformvpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public SBN 1"
  }
}


#Public Subnet 2
resource "aws_subnet" "Public1B" {
  vpc_id     = aws_vpc.Terraformvpc.id
  cidr_block = "10.0.2.0/24"
   availability_zone = "us-east-1a"
   map_public_ip_on_launch = true

  tags = {
    Name = "Public SBN 2"
  }


#Associating Public Subnets with Route Table
resource "aws_route_table_association" "Public-Subnet1-RT-Association" {
  subnet_id      = aws_subnet.Public1A.id
  route_table_id = aws_route_table.public_route_table.id
}
resource "aws_route_table_association" "Public-Subnet2-RT-Association" {
  subnet_id      = aws_subnet.Public1B.id
  route_table_id = aws_route_table.public_route_table.id
}









}