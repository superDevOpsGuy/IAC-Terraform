provider "aws" {
  shared_credentials_files = ["/root/.aws/credentials"]
  region  = "ap-south-1"
}

terraform {
  required_version = ">=1.7.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.35.0"
    }
  }
}
