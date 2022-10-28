# --ec2/output.tf --

output "instance_public_ip"{
    value = aws_instance.app_server.public_ip
}

output "instance_name" {
value = aws_instance.app_server.tags["Name"]
}

output "instance_state"{
    value = aws_instance.app_server.instance_state
}

