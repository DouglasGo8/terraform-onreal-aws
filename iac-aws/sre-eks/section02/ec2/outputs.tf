output "aws_instance_public_ip" {
  description = "EC2 Instance Public IP"
  value       = aws_instance.t2-medium-demo[*].public_ip
}