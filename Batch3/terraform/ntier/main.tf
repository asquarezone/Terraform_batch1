# declaring a vpc
resource "aws_vpc" "network" {
  cidr_block = var.network_cidr
  tags = {
    Name        = "ntier"
    Environment = "dev"
  }
}

# Declare public subnets
resource "aws_subnet" "public_subnets" {
  count             = length(var.public_subnets)
  vpc_id            = aws_vpc.network.id
  cidr_block        = var.public_subnets[count.index].cidr
  availability_zone = var.public_subnets[count.index].az
  tags = {
    Name        = var.public_subnets[count.index].name
    Environment = "dev"
  }

  depends_on = [aws_vpc.network]
}


# Declare private subnets
resource "aws_subnet" "private_subnets" {
  count             = length(var.private_subnets)
  vpc_id            = aws_vpc.network.id
  cidr_block        = var.private_subnets[count.index].cidr
  availability_zone = var.private_subnets[count.index].az
  tags = {
    Name        = var.private_subnets[count.index].name
    Environment = "dev"
  }

  depends_on = [aws_vpc.network]
}
