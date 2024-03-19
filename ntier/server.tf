
resource "aws_instance" "server" {
  ami                         = "ami-007020fd9c84e18c7"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.ntier.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.openall.id]




}

resource "null_resource" "server" {

  triggers = {
    trigger = var.execution_trigger
  }
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    host        = aws_instance.server.public_dns
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install nginx -y"
    ]

  }

}