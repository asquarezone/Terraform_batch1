terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.41.0"
    }
  }
  backend "s3" {
    bucket = "dmt-state-batch1"
    key    = "module/terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "dmtlock_batch1"
  }

}

provider "aws" {
  # Configuration options
  region = "ap-south-1"
}