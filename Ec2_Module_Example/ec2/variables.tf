#---ec2/variables.tf --

variable "ami_id" {
  type    = string
  default = "ami-0d593311db5abb72b"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "region" {
  type    = string
  default = "us-east-1"
}