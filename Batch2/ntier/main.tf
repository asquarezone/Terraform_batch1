module "vpc" {
    source = "./modules/vpc"
    vpc_cidr = "192.168.0.0/16"
    enable_nat_gateway = false
    private_subnets = [
        {
            cidr = "192.168.0.0/24"
            availability_zone = "us-east-1a"
            name = "private-1"
        }
    ]
    public_subnets = [
        {
            cidr = "192.168.100.0/24"
            availability_zone = "us-east-1b"
            name = "public-1"
        }
    ]
}