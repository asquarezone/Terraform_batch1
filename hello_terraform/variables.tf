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