resource "aws_eip" "ec2_bastion_eip" {
  depends_on = [
    module.ec2_bastion_instance,
    # vpc must be created before
    #module.vpc
  ]
  instance = module.ec2_bastion_instance.id #[0]?
  #vpc      = true
  tags     = local.common_tags
}