#initial config for terraform to connect to AWS
terraform {
  backend "http" {
  }
  # required_version = ">= 1.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.4"
    }
  }
}


# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}
    