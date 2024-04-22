network_cidr = "192.168.0.0/16"
public_subnets = [{
  cidr = "192.168.0.0/24"
  az   = "us-west-2a"
  name = "web1"
  }, {
  cidr = "192.168.1.0/24"
  az   = "us-west-2b"
  name = "web2"
  }
]
private_subnets = [{
  cidr = "192.168.2.0/24"
  az   = "us-west-2a"
  name = "db1"
  }, {
  cidr = "192.168.3.0/24"
  az   = "us-west-2b"
  name = "db2"
  }
]