terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.22.0"
    }
  }
}

provider "docker {}"

provider "aws" {
  region     = var.aws_region
  access_key = var.access_key
  secret_key = var.secret_key
}

