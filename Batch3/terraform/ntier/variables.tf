variable "network_cidr" {
  type        = string
  default     = "192.168.0.0/16"
  description = "cidr for a vpc"
}

variable "public_subnets" {
  type = list(object({
    cidr = string
    az   = string
    name = string
  }))
  default = [{
    cidr = "192.168.0.0/24"
    az   = "us-west-2a"
    name = "web1"
    }, {
    cidr = "192.168.1.0/24"
    az   = "us-west-2b"
    name = "web2"
    }
  ]
}

variable "private_subnets" {
  type = list(object({
    cidr = string
    az   = string
    name = string
  }))
  default = [{
    cidr = "192.168.2.0/24"
    az   = "us-west-2a"
    name = "db1"
    }, {
    cidr = "192.168.3.0/24"
    az   = "us-west-2b"
    name = "db2"
    }
  ]
}

