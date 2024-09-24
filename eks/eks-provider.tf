provider "aws" {    
    region = var.region
    access_key = AWS_ACCESS_KEY_ID
    secret_key = AWS_SECRET_ACCESS_KEY
   # access_key = var.access_key
   # secret_key = var.secret_key
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}