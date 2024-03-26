variable "vpc_cidr" {
  type        = string
  default     = "192.168.0.0/16"
  description = "this is vpc cidr"

}

variable "public_subnets" {
  type = list(object({
    name              = string
    cidr              = string
    availability_zone = string
  }))
  default = [{
    name              = "web-1"
    cidr              = "192.168.1.0/24"
    availability_zone = "ap-south-1a"
  }]

}


variable "private_subnets" {
  type = list(object({
    name              = string
    cidr              = string
    availability_zone = string
  }))
  default = [{
    name              = "app-1"
    cidr              = "192.168.2.0/24"
    availability_zone = "ap-south-1a"
    },
    {
      name              = "db-1",
      cidr              = "192.168.3.0/24",
      availability_zone = "ap-south-1a"
  }]

}

variable "enable_nat_gateway" {
  type    = bool
  default = false
}