variable "vpc_cidr" {
  type        = string
  description = "vpc cidr"
  default     = "10.0.0.0/16"
}


variable "public_subnets" {
  type = list(object({
    name = string
    cidr = string
    az   = string
  }))
  default = [{
    name = "web1"
    cidr = "10.0.1.0/24"
    az   = "us-west-2a"
  }]
}