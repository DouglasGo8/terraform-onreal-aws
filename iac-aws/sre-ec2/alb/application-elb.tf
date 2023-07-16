module "application-elb" {
  source             = "terraform-aws-modules/alb/aws"
  version            = "8.7.0"
  name               = "${local.name}-application-elb-http"
  #
  load_balancer_type = "application"
  vpc_id             = "data.vpc_id"
  subnets            = ["var.subnet_1.xxx", "var.subnet_2.yyy"]
  security_groups    = [module.application_elb_http_sg.security_group_id] # bastion host
  # Listeners
  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0 # TG Index = 0
    }
  ]
  # Target Groups
  target_groups = [
    # App1 Target Group - TG Index = 0
    {
      name_prefix          = "app1-"
      backend_protocol     = "HTTP"
      backend_port         = 80
      target_type          = "instance"
      deregistration_delay = 10
      health_check         = {
        enabled             = true
        interval            = 30
        path                = "/app1/index.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }
      protocol_version = "HTTP1"
      # App1 Target Group - Targets
      targets          = {
        my_app1_vm1 = {
          target_id = "ec2_private.id[0]"
          port      = 80
        },
        my_app1_vm2 = {
          target_id = "ec2_private.id[1]"
          port      = 8080
        }
      }
      tags = local.common_tags # Target Group Tags
    }
  ]

  tags = local.common_tags
}