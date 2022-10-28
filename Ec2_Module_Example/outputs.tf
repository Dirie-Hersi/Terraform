#---root/outputs.tf ---

output "Instance_Public_IP" {
  value = module.ec2.instance_public_ip
}

output "Name"{
    value = module.ec2.instance_name
}

output "Status" {
  value = module.ec2.instance_state
}

