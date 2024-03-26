resource "aws_vpc" "ntier" {
  cidr_block = var.vpc_cidr
  tags = {
    Name        = "ntier"
    Environment = "dev"
    CreatedBy   = "Terraform"
  }
}

resource "aws_subnet" "public" {
  count             = length(var.public_subnets)
  vpc_id            = aws_vpc.ntier.id
  cidr_block        = var.public_subnets[count.index].cidr
  availability_zone = var.public_subnets[count.index].availability_zone
  tags = {
    Name = var.public_subnets[count.index].name
  }

  depends_on = [aws_vpc.ntier]
}

resource "aws_subnet" "private" {
  count             = length(var.private_subnets)
  vpc_id            = aws_vpc.ntier.id
  cidr_block        = var.private_subnets[count.index].cidr
  availability_zone = var.private_subnets[count.index].availability_zone
  tags = {
    Name = var.private_subnets[count.index].name
  }

  depends_on = [aws_vpc.ntier]
}