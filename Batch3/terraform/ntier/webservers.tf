# declare a ec2 instance in public subnet

resource "aws_instance" "web1" {
  ami                         = var.public_instance_config.ami
  associate_public_ip_address = true
  instance_type               = var.public_instance_config.instance_type
  key_name                    = var.public_instance_config.key_name
  subnet_id                   = aws_subnet.public_subnets[0].id
  vpc_security_group_ids      = [aws_security_group.web.id]
  tags = {
    Name        = var.public_instance_config.name
    Environment = "dev"
  }
  connection {
    type        = "ssh"
    user        = var.public_instance_config.user_name
    host        = self.public_ip
    private_key = file(var.public_instance_config.key_path)
  }
  provisioner "remote-exec" {
    script = "./scripts/install.sh"

  }

}