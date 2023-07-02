output "ec2_bastion_ids" {
  value = module.ec2_bastion_instance.id
}

output "ec2_bastion_public_ip" {
  value = module.ec2_bastion_instance.public_ip
}