resource "null_resource" "name" {
  depends_on = [module.ec2_bastion_instance]
  connection {
    type        = "ssh"
    user        = "ec2-user"
    password    = ""
    host        = aws_eip.ec2_bastion_eip.public_ip
    private_key = file(path.module("../../../.secret/key.pem"))
  }

  provisioner "file" {
    source      = file(path.module("../../../.secret/key.pem"))
    destination = "/tmp/key.pem"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/key.pem"
    ]
  }

  provisioner "local-exec" {
    command     = "echo VPC created on `date` with VPC ID: ${data.vpc.id} >> vpc_info.txt"
    working_dir = "local-exec-output-files/"
  }

  provisioner "local-exec" {
    command     = "echo Destroy time prov `date` >> destroyed_info.txt"
    working_dir = "local-exec-output-files/"
    when        = destroy
  }
}