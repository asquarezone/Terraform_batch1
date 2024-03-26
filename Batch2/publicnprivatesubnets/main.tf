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

# create a internet gateway
resource "aws_internet_gateway" "ntier" {
  vpc_id = aws_vpc.ntier.id
  tags = {
    Name = "ntier-igw"
  }

}

# create a route table (public)
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.ntier.id
  tags = {
    Name = "ntier-public"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ntier.id
  }
}

resource "aws_route_table_association" "public" {
  count          = length(var.public_subnets)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id

}

resource "aws_eip" "nat" {
    count = var.enable_nat_gateway ? 1 : 0

}

resource "aws_nat_gateway" "ntier" {
  count         = var.enable_nat_gateway ? 1 : 0
  subnet_id     = aws_subnet.public[0].id
  allocation_id = aws_eip.nat[0].id
}

# we need default route table id

data "aws_route_table" "default" {
    filter {
      name = "association.main"
      values = [ true ]
    }
    vpc_id = aws_vpc.ntier.id
    depends_on = [ aws_subnet.private ]
}


resource "aws_route" "nat_route" {
    count = var.enable_nat_gateway ? 1 : 0
    
    route_table_id = data.aws_route_table.default.id
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ntier[0].id
  
}