resource "aws_vpc" "network" {
  cidr_block = var.network_cidr
  tags = {
    Name        = "ntier"
    Environment = "dev"
  }
}