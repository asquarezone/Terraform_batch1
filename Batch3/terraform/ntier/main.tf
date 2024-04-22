# declaring a vpc
resource "aws_vpc" "network" {
  cidr_block = var.network_cidr
  tags = {
    Name        = "ntier"
    Environment = "dev"
  }
}

# declaring a public subnet web1
resource "aws_subnet" "web1" {
  cidr_block        = var.web1_subnet_info.cidr
  availability_zone = var.web1_subnet_info.az
  # implicit dependency on the vpc
  vpc_id = aws_vpc.network.id
  tags = {
    Name        = var.web1_subnet_info.name
    Environment = "dev"
  }

  # explicit dependency on the vpc
  depends_on = [
    aws_vpc.network
  ]

}


# declaring a public subnet web2
resource "aws_subnet" "web2" {
  cidr_block        = var.web2_subnet_info.cidr
  availability_zone = var.web2_subnet_info.az
  # implicit dependency on the vpc
  vpc_id = aws_vpc.network.id
  tags = {
    Name        = var.web2_subnet_info.name
    Environment = "dev"
  }

  # explicit dependency on the vpc
  depends_on = [
    aws_vpc.network
  ]

}

# declaring a public subnet db1
resource "aws_subnet" "db1" {
  cidr_block        = var.db1_subnet_info.cidr
  availability_zone = var.db1_subnet_info.az
  # implicit dependency on the vpc
  vpc_id = aws_vpc.network.id
  tags = {
    Name        = var.db1_subnet_info.name
    Environment = "dev"
  }

  # explicit dependency on the vpc
  depends_on = [
    aws_vpc.network
  ]

}


# declaring a public subnet web2
resource "aws_subnet" "db2" {
  cidr_block        = var.db2_subnet_info.cidr
  availability_zone = var.db2_subnet_info.az
  # implicit dependency on the vpc
  vpc_id = aws_vpc.network.id
  tags = {
    Name        = var.db2_subnet_info.name
    Environment = "dev"
  }

  # explicit dependency on the vpc
  depends_on = [
    aws_vpc.network
  ]

}