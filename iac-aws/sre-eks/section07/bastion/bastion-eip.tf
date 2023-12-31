# Watch out expensive resource
resource "aws_eip" "bastion_instance_eip" {
  instance   = module.bastion_instance.id
  domain     = "vpc"
  # deprecated argument
  # vpc        = true
  tags       = local.common_tags
  #
  depends_on = [
    module.bastion_instance,
    module.main-vpc
  ]
}