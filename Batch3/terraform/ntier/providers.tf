terraform {
  required_providers {
    aws = {
      version = ">= 5.46.0"
      source  = "hashicorp/aws"
    }
  }
  required_version = ">= 1.7.4"
}

provider "aws" {
  region = "us-west-2"
}