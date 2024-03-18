resource "aws_vpc" "network" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "ntier-vpc"
  }
}

