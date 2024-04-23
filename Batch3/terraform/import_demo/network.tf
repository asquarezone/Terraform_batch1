resource "aws_vpc" "network" {
  cidr_block                           = "10.0.0.0/16"
  enable_dns_hostnames                 = true
  enable_dns_support                   = true
  enable_network_address_usage_metrics = false
  instance_tenancy                     = "default"
  tags = {
    "Name" = "importdemo-vpc"
  }
}

resource "aws_subnet" "public" {
  availability_zone = "us-west-2a"
  cidr_block        = "10.0.0.0/20"
  tags = {
    "Name" = "importdemo-subnet-public1-us-west-2a"
  }
  vpc_id = aws_vpc.network.id
}