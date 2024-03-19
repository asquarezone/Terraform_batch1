variable "network_cidr" {
  type = string
  default = "10.10.0.0/16"
}

variable "subnets" {
  type = list(string)
  default = [ "web", "app", "db" ]
}

variable "public_subnets" {
    type = list(string)
    default = [ "web" ]
}