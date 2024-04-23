# declaring a vpc
resource "aws_vpc" "network" {
  cidr_block = var.network_cidr
  tags = {
    Name        = "ntier"
    Environment = terraform.workspace
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
    Environment = terraform.workspace
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
    Environment = terraform.workspace
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


# Declare a security group for the public instances opening 80 and 22 ports

resource "aws_security_group" "web" {
  description = "Allow incoming HTTP connections & SSH access"
  name        = var.web_security_group.name
  vpc_id      = aws_vpc.network.id
  depends_on  = [aws_vpc.network]
}

resource "aws_security_group_rule" "web_incoming" {
  count             = length(var.web_security_group.ports)
  type              = "ingress"
  from_port         = var.web_security_group.ports[count.index]
  to_port           = var.web_security_group.ports[count.index]
  protocol          = local.tcp
  cidr_blocks       = [local.any_where]
  security_group_id = aws_security_group.web.id
  depends_on        = [aws_security_group.web]
}
resource "aws_vpc_security_group_egress_rule" "allow_all_web" {
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_security_group" "db" {
  description = "Allow incoming HTTP connections & SSH access"
  name        = var.db_security_group.name
  vpc_id      = aws_vpc.network.id
  depends_on  = [aws_vpc.network]
}

resource "aws_security_group_rule" "db_incoming" {
  count             = length(var.db_security_group.ports)
  type              = "ingress"
  from_port         = var.db_security_group.ports[count.index]
  to_port           = var.db_security_group.ports[count.index]
  protocol          = local.tcp
  cidr_blocks       = [var.network_cidr]
  security_group_id = aws_security_group.db.id
  depends_on        = [aws_security_group.db]
}

resource "aws_vpc_security_group_egress_rule" "allow_all_db" {
  security_group_id = aws_security_group.db.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
