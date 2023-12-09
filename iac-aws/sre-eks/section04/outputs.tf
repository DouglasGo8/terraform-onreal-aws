# EC2 Instance Public IP
output "aws_instance_public_ip" {
  description = "EC2 Instance Public IP"
  value       = aws_instance.t2-nano-demo[*].public_ip
}

# EC2 Instance Public DNS
output "instance_public_dns" {
  description = "EC2 Instance Public DNS"
  value       = aws_instance.t2-nano-demo[*].public_dns
}