terraform {
  backend "s3" {
    bucket         = var.s3_bucket_name
    key            = "omni/terraform.tfstate" 
    region         = var.region
    dynamodb_table = var.dynamodb_table_name
    encrypt        = true 
  }
} 