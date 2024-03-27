terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.42.0"
    }
  }
  backend "s3" {
    bucket = "dmttfstate"
    region = "us-east-1"
    key = "batch2/workspace_demo.tfstate"
    dynamodb_table = "batch2"
    
  }
}

provider "aws" {
  # Configuration options
  region = "ap-south-1"
}