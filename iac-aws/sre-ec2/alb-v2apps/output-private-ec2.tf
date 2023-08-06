output "app1_ec2_private_ids" {
  value = module.ec2_private_instance_app1.id
}

output "app1_ec2_private_public_ip" {
  value = module.ec2_private_instance_app1.private_ip
}

output "app2_ec2_private_ids" {
  value = module.ec2_private_instance_app2.id
}

output "app2_ec2_private_public_ip" {
  value = module.ec2_private_instance_app2.private_ip
}

output "mydomain_zoneid" {
  value = data.aws_route53_zone.mydomain.zone_id
}

output "mydomain_name" {
  value = data.aws_route53_zone.mydomain.name
}