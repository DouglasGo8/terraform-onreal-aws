resource "null_resource" "copy_EC2Key" {
  depends_on = [
    module.bastion_instance
  ]
  #ConnectionBlock
  connection {
    type  = "ssh"
    host  = aws_eip.bastion_instance_eip.public_ip
    user  = "ec2-user"
    #password    = ""
    #insecure = true
    #.pem without password
    private_key = file("../../../../.secret/key.pem")
  }

  ## File Provisioner: Copies the terraform-key.pem file to /tmp/*.pem
  provisioner "file" {
    source      = "../../../../.secret/key.pem"
    destination = "/tmp/key.pem"
  }

  ## Remote Exec Provisioner: Using remote-exec provisioner fix the private key permissions on Bastion Host
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/key.pem"
    ]
  }

  ## Local Exec Provisioner:  local-exec provisioner (Creation-Time Provisioner - Triggered during Create Resource)
  provisioner "local-exec" {
    command     = "echo VPC created on `date` and VPC ID: ${module.main-vpc.vpc_id} >> creation-time-vpc-id.txt"
    working_dir = "local-exec-output-files/"
  }
}