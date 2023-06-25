output "ec2_private_ids" {
  value = module.ec2_private_instance.id
}

output "ec2_private_public_ip" {
  value = module.ec2_private_instance.private_ip
}