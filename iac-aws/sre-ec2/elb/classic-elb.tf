module "classic_elb_http" {

  source   = "terraform-aws-modules/elb/aws"
  version  = "4.0.1"
  name     = "${local.name}-classic-elb-http"
  internal = false

  subnets = [
    # module.vpc.public_subnets[0]
    var.AWS_SUBNET_PUBLIC_ONE,
    var.AWS_SUBNET_PUBLIC_TWO
  ]
  listener = [
    {
      instance_port     = 80
      instance_protocol = "HTTP"
      lb_port           = 80
      lb_protocol       = "HTTP"
    },
    {
      # must verify on security group is enabled to 81 port ingress rule
      instance_port     = 80
      instance_protocol = "HTTP"
      lb_port           = 81
      lb_protocol       = "HTTP"
      #ssl_certificate_id = "arn:aws:acm:sa-east-1:<<ID>>:certificate/<<ID>>"
    }
  ]
  security_groups = [module.classic_elb_http_sg.security_group_id]

  health_check = {
    target              = "HTTP:80/"
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
  }

  #ELB Attachments
  number_of_instances = 1
  instances           = [
    # module.ec2_private_instance.id[0]
    "ec2_private_instance.id"
  ]

  tags = local.common_tags
}