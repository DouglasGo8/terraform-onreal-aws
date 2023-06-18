output "instance_ec2_ip" {
  value = aws_instance.t2-micro-inst.public_ip
}

output "instance_ec2_dns" {
  value = aws_instance.t2-micro-inst.public_dns
}