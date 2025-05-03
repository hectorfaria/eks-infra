locals {
  env         = "engineering"
  region      = "us-east-1"
  zone1       = "us-east-1a"
  zone2       = "us-east-1b"
  eks_name    = "demo"
  eks_version = "1.32"
}

provider "aws" {
  region = local.region
}

terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.49"
    }
  }
}