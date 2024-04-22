resource "aws_vpc" "network" {
  cidr_block = "192.168.0.0/16"
  tags = {
    Name        = "ntier"
    Environment = "dev"
  }
}