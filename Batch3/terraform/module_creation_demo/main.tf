module "vpc" {
    source = "./modules/vpc"
    vpc_cidr = "10.0.0.0/16"
    public_subnets = [{
      cidr = "10.0.1.0/24"
      name = "web"
      az = "us-west-2a"
    }]
}

