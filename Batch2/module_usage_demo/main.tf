module "web_server_sg" {
  source  = "terraform-aws-modules/security-group/aws//modules/http-80"
  version = "5.1.2"

  name        = "web-server"
  description = "Security group for web-server with HTTP ports open within VPC"
  vpc_id      = "vpc-06e49f59e4246fd88"

  ingress_cidr_blocks = ["10.0.0.0/8"]
}