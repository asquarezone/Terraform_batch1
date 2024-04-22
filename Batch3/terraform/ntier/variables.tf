variable "network_cidr" {
  type        = string
  default     = "192.168.0.0/16"
  description = "cidr for a vpc"
}

variable "web1_subnet_info" {
    type = object({
      cidr = string
      az = string
      name = string 
    })
    default = {
      cidr = "192.168.0.0/24"
      az = "us-west-2a"
      name = "web1"
    }
}
