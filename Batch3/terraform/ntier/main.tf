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

# Declare internet gateway
resource "aws_internet_gateway" "ntier_igw" {
  vpc_id = aws_vpc.network.id
  tags = {
    Name = "ntier_igw"
  }

  depends_on = [
    aws_vpc.network
  ]
}

# Declare a public route table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.network.id
  tags = {
    Name = "public"
  }
  route {
    cidr_block = local.any_where
    gateway_id = aws_internet_gateway.ntier_igw.id
  }

  depends_on = [
    aws_vpc.network,
    aws_internet_gateway.ntier_igw
  ]
}

# Associate public subnets with the public route table
resource "aws_route_table_association" "public_route_table_association" {
  count          = length(var.public_subnets)
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_route_table.id

  depends_on = [
    aws_subnet.public_subnets,
    aws_route_table.public_route_table
  ]
}

# Declare private route table
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.network.id
  tags = {
    Name = "private"
  }

  depends_on = [
    aws_vpc.network
  ]
}

# Associate private subnets with the private route table
resource "aws_route_table_association" "private_route_table_association" {
  count          = length(var.private_subnets)
  subnet_id      = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.private_route_table.id

  depends_on = [
    aws_subnet.private_subnets,
    aws_route_table.private_route_table
  ]
}
