terraform {
  required_providers {
    aws = {
      version = ">= 5.46.0"
      source  = "hashicorp/aws"
    }
  }
  required_version = ">= 1.7.4"
  backend "s3" {
    bucket = "batch3state"
    key    = "ntier/terraform.tfstate"
    region = "us-west-2"
    dynamodb_table = "tfstate"
  }
}

provider "aws" {
  region = "us-west-2"
}