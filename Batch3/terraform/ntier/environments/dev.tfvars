network_cidr = "10.100.0.0/16"
public_subnets = [ {
  cidr = "10.100.0.0/24",
  az = "us-west-2a",
  name = "web-1"
}, {
    cidr = "10.100.1.0/24",
    az = "us-west-2b",
    name = "web-2"
}
]

private_subnets = [ {
  cidr = "10.100.200.0/24",
  az = "us-west-2a"
  name = "db-1"
},{
  cidr = "10.100.201.0/24",
  az = "us-west-2b"
  name = "db-2"
} ]