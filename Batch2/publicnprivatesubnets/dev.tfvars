vpc_cidr = "192.168.0.0/16"
public_subnets = [{
  name              = "web-1"
  cidr              = "192.168.0.0/24"
  availability_zone = "ap-south-1a"
  },
  {
    name              = "web-2",
    cidr              = "192.168.1.0/24"
    availability_zone = "ap-south-1b"
}]

private_subnets = [{
  name              = "app-1"
  cidr              = "192.168.2.0/24"
  availability_zone = "ap-south-1a"
  },
  {
    name              = "db-1",
    cidr              = "192.168.3.0/24",
    availability_zone = "ap-south-1a"
  },
  {
    name              = "app-2"
    cidr              = "192.168.4.0/24"
    availability_zone = "ap-south-1b"
  },
  {
    name              = "db-2",
    cidr              = "192.168.5.0/24",
    availability_zone = "ap-south-1b"
}]
enable_nat_gateway = false