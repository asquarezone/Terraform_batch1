terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.42.0"
    }
  }
  backend "s3" {
    bucket = "dmttfstate"
    region = "us-east-1"
    key = "batch2/ntier-terraform.tfstate"
    dynamodb_table = "batch2"
    
  }
}

provider "aws" {
  region = "us-east-1"
}