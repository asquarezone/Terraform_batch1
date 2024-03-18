resource "aws_vpc" "network" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "ntier-vpc"
  }
}

resource "aws_subnet" "subnets" {
  count             = 6
  vpc_id            = aws_vpc.network.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, count.index)
  availability_zone = var.subnet_availability_zone[count.index]
  tags = {
    Name = var.subnet_names[count.index]
  }
  depends_on = [
    aws_vpc.network
  ]

}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.network.id
  tags = {
    Name = "ntier-igw"
  }
}



resource "aws_route_table" "public" {
  vpc_id = aws_vpc.network.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "ntier-public"
  }
}

data "aws_subnets" "public" {

  filter {
    name   = "tag:Name"
    values = var.public_subnets
  }
  depends_on = [aws_subnet.subnets]
}

resource "aws_route_table_association" "public" {
  for_each       = toset(data.aws_subnets.public.ids)
  subnet_id      = each.key
  route_table_id = aws_route_table.public.id
  depends_on     = [data.aws_subnets.public]
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.network.id
  tags = {
    Name = "ntier-private"
  }

}

data "aws_subnets" "private" {

  filter {
    name   = "tag:Name"
    values = var.private_subnets
  }
  depends_on = [aws_subnet.subnets]
}

resource "aws_route_table_association" "private" {
  for_each       = toset(data.aws_subnets.private.ids)
  subnet_id      = each.key
  route_table_id = aws_route_table.private.id
  depends_on     = [data.aws_subnets.private]
}


