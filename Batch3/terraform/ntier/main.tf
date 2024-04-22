# declaring a vpc
resource "aws_vpc" "network" {
  cidr_block = var.network_cidr
  tags = {
    Name        = "ntier"
    Environment = "dev"
  }
}

# Create subnets
resource "aws_subnet" "subnets" {
  count             = length(var.subnets_config)
  vpc_id            = aws_vpc.network.id
  cidr_block        = var.subnets_config[count.index].cidr
  availability_zone = var.subnets_config[count.index].az
  tags = {
    Name        = var.subnets_config[count.index].name
    Environment = "dev"
  }

  depends_on = [aws_vpc.network]
}
