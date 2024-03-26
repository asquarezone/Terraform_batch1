resource "aws_vpc" "network" {
  cidr_block = "10.100.0.0/16"
  tags = {
    Name        = "first-vpc"
    CreatedBy   = "Terraform"
    Environment = "Dev"
  }

}

resource "aws_subnet" "subnet_1" {
  cidr_block = "10.100.0.0/24"
  availability_zone = "ap-south-1a"
  vpc_id = aws_vpc.network.id
  tags = {
    Name = "subnet 1"
  }
}

resource "aws_subnet" "subnet_2" {
  cidr_block = "10.100.1.0/24"
  availability_zone = "ap-south-1b"
  vpc_id = aws_vpc.network.id
  tags = {
    Name = "subnet 2"
  }
}