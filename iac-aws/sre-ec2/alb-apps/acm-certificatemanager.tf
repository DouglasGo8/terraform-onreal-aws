module "acm" {
  source      = "terraform-aws-modules/acm/aws"
  version     = "2.14.0"
  #
  domain_name = trimsuffix(data.aws_route53_zone.mydomain.name, ".")
  zone_id     = ""

  subject_aternative_names = [
    "*.my-domain.com",
    "app.sub.my-domain.com"
  ]

  tags = local.common_tags
}
}