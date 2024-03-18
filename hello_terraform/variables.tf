variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "this is vpc cidr range"
}


variable "subnet_names" {
  type    = list(string)
  default = ["web-1", "web-2", "app-1", "app-2", "db-1", "db-2"]

}


variable "subnet_availability_zone" {
  type    = list(string)
  default = ["ap-south-1a", "ap-south-1b", "ap-south-1a", "ap-south-1b", "ap-south-1a", "ap-south-1b"]

}

variable "key_pair_name" {
  type    = string
  default = "my_idrsa"

}

variable "ami_id" {
  type    = string
  default = "ami-007020fd9c84e18c7"

}

variable "instance_type" {
  type    = string
  default = "t2.micro"

}