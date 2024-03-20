module "vpc" {
    source = "./modules/vpc"
    network_cidr = var.vpc_cidr
    subnets = ["web-1", "web-2", "app-1", "app-2"]
    public_subnets = ["web-1", "web-2"]
}

output "vpc-id" {
  value = module.vpc.id
  
}