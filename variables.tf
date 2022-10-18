variable "access_key" {
    type = string
    sensitive = true
}

variable "secret_key" {
    type = string
    sensitive = true
}

variable "aws_region" {
    type = string
    default = "us-east-1"
}

variable "centos_image" {
    type = string
    default = "centos:latest"
}

variable "azs" {
    type = list(string)
    default = ["us-east-1a", "us-east-1b"]
}

variable "vpc_cidr" {
    type = string
    default = "10.0.0.0/16"
}

variable "public_sb" {
    type = list(string)
    default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_sb" {
    type = list (string)
    default = ["10.0.3.0/24", "10.0.4.0/24"]
}