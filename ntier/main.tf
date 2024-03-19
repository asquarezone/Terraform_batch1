resource "aws_key_pair" "ntier" {
  key_name   = "ntier"
  public_key = file("~/.ssh/id_rsa.pub")

}

data "aws_vpc" "default" {
  default = true
}


resource "aws_security_group" "openall" {
  vpc_id = data.aws_vpc.default.id
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}

