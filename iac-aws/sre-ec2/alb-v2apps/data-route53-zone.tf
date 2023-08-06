data "aws_route53_zone" "mydomain" {
  name         = "test.com."
  private_zone = false
}

