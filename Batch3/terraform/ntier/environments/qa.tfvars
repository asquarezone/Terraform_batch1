network_cidr = "192.168.0.0/16"
public_subnets = [ {
  cidr = "192.168.0.0/24",
  az = "us-west-2a",
  name = "web-1"
}, {
    cidr = "192.168.1.0/24",
    az = "us-west-2b",
    name = "web-2"
}
]

private_subnets = [ {
  cidr = "192.168.200.0/24",
  az = "us-west-2a"
  name = "db-1"
},{
  cidr = "192.168.201.0/24",
  az = "us-west-2b"
  name = "db-2"
} ]