terraform {
  # version of terraform
  required_version = "> 1.7.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "> 5.39.0"
    }
  }
  backend "s3" {
    bucket         = "dmt-state-batch1"
    key            = "ntier/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "dmtlock_batch1"
  }
}

provider "aws" {
  region = "ap-south-1"
  default_tags {
    tags = {
      created_by  = "terraform"
      Environment = "Dev"
    }
  }

}