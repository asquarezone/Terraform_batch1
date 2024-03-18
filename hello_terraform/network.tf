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

resource "aws_route_table_association" "web1" {
  subnet_id      = aws_subnet.subnets[0].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "web2" {
  subnet_id      = aws_subnet.subnets[1].id
  route_table_id = aws_route_table.public.id
}


resource "aws_route_table" "private" {
  vpc_id = aws_vpc.network.id
  tags = {
    Name = "ntier-private"
  }

}

resource "aws_route_table_association" "app1" {
  subnet_id      = aws_subnet.subnets[2].id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "app2" {
  subnet_id      = aws_subnet.subnets[3].id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "db1" {
  subnet_id      = aws_subnet.subnets[4].id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "db2" {
  subnet_id      = aws_subnet.subnets[5].id
  route_table_id = aws_route_table.private.id
}

