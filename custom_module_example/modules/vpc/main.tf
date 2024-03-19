resource "aws_vpc" "network" {
    cidr_block = var.network_cidr
    enable_dns_hostnames = true
    enable_dns_support = true
    tags = {
      Name = "from-module"
    }
}

resource "aws_subnet" "subnets" {
    count = length(var.subnets)
    cidr_block = cidrsubnet(var.network_cidr,8,count.index)
    vpc_id = aws_vpc.network.id
    tags = {
      Name = var.subnets[count.index]
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.network.id
    tags = {
      Name = "igw"
    }
  
}

resource "aws_route_table" "public" {
    vpc_id = aws_vpc.network.id
    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.igw.id
    }
    tags = {
      Name = "public"
    }
}
  

# data "aws_subnets" "public" {
#     filter {
#       name = "vpc-id"
#       values = [aws_vpc.network.id]
#     }
#     filter {
#         name = "tag:Name"
#         values = var.public_subnets
#     }
#     depends_on = [ aws_subnet.subnets ]
  
# }

# resource "aws_route_table_association" "public" {
#     route_table_id = aws_route_table.public.id
#     for_each = toset(data.aws_subnets.public.ids)
#     subnet_id = each.key
#     depends_on = [ aws_subnet.subnets ]
# }