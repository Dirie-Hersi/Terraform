#---compute/main.tf ---

data "aws_ami" "server_ami" {
    most_recent = true
    owners = ["099720109477"]
    
    filter {
        name = "name"
        value = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
    }
}