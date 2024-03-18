resource "aws_security_group" "websg" {
  vpc_id = aws_vpc.network.id
  name   = "websg"
  ingress {
    from_port        = local.http_port
    to_port          =  local.http_port
    cidr_blocks      = [local.anywhere]
    protocol         = local.tcp
    ipv6_cidr_blocks = [local.anywhere_ipv6]

  }
  ingress {
    from_port        = local.ssh_port
    to_port          = local.ssh_port
    cidr_blocks      = [local.anywhere]
    protocol         = local.tcp
    ipv6_cidr_blocks = [local.anywhere_ipv6]

  }

  egress {
    from_port        = 0
    to_port          = 0
    cidr_blocks      = [local.anywhere]
    protocol         = local.any_protocol
    ipv6_cidr_blocks = [local.anywhere_ipv6]

  }
  tags = {
    Name = "websg"
  }
}