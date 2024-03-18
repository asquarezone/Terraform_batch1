resource "aws_security_group" "websg" {
  vpc_id = aws_vpc.network.id
  name   = "websg"
  ingress {
    from_port        = 80
    to_port          = 80
    cidr_blocks      = ["0.0.0.0/0"]
    protocol         = "tcp"
    ipv6_cidr_blocks = ["::/0"]

  }
  ingress {
    from_port        = 22
    to_port          = 22
    cidr_blocks      = ["0.0.0.0/0"]
    protocol         = "tcp"
    ipv6_cidr_blocks = ["::/0"]

  }

  egress {
    from_port        = 0
    to_port          = 0
    cidr_blocks      = ["0.0.0.0/0"]
    protocol         = "-1"
    ipv6_cidr_blocks = ["::/0"]

  }
  tags = {
    Name = "websg"
  }
}