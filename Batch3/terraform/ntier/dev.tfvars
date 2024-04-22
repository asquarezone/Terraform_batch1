network_cidr = "10.0.0.0/16"
public_subnets = [{
  cidr = "10.0.0.0/24"
  az   = "us-west-2a"
  name = "web-1"
  }, {
  cidr = "10.0.1.0/24",
  az   = "us-west-2b",
  name = "web-2"
  }
]
private_subnets = [{
  cidr = "10.0.2.0/24"
  az   = "us-west-2a",
  name = "app-1",
  }, {
  cidr = "10.0.3.0/24"
  az   = "us-west-2b",
  name = "app-2",
  }, {
  cidr = "10.0.4.0/24"
  az   = "us-west-2a",
  name = "db-1",
  }, {
  cidr = "10.0.5.0/24"
  az   = "us-west-2b",
  name = "db-2",
  }
]