resource "aws_instance" "web1" {
  ami                         = var.ami_id
  associate_public_ip_address = true
  instance_type               = var.instance_type
  key_name                    = var.key_pair_name
  vpc_security_group_ids      = [aws_security_group.websg.id]
  subnet_id                   = aws_subnet.subnets[0].id

  tags = {
    Name = "Web1"
  }
}