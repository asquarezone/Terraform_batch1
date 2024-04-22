# configure provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.46.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}


# find a resource for creating s3

resource "aws_s3_bucket" "first" {
  bucket = "qtdmt-imp"
}