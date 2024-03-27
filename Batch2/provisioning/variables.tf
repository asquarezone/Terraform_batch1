variable "ami" {
    type = string
    default = "ami-007020fd9c84e18c7"
  
}

variable "key_pair" {
    type = string
    default = "docker"
  
}

variable "security_group_id" {
  type = string
  default = "sg-0b7d54e249299e7c1"
}

variable "availability_zone" {
  type = string
  default = "ap-south-1a"
  
}

variable "my_trigger" {
  type = string
  default = "v1"
  
}