variable "network_cidr" {
  type        = string
  default     = "192.168.0.0/16"
  description = "cidr for a vpc"
}

variable "web1_subnet_info" {
  type = object({
    cidr = string
    az   = string
    name = string
  })
  default = {
    cidr = "192.168.0.0/24"
    az   = "us-west-2a"
    name = "web1"
  }
}

variable "web2_subnet_info" {
  type = object({
    cidr = string
    az   = string
    name = string
  })
  default = {
    cidr = "192.168.1.0/24"
    az   = "us-west-2b"
    name = "web2"
  }
}

variable "db1_subnet_info" {
  type = object({
    cidr = string
    az   = string
    name = string
  })
  default = {
    cidr = "192.168.2.0/24"
    az   = "us-west-2a"
    name = "db1"
  }
}

variable "db2_subnet_info" {
  type = object({
    cidr = string
    az   = string
    name = string
  })
  default = {
    cidr = "192.168.3.0/24"
    az   = "us-west-2b"
    name = "db2"
  }
}
