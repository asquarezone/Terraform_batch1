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

}

