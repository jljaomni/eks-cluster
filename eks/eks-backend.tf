terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket-omni"
    key            = "terraform.tfstate" 
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locks-omni"
    encrypt        = true 
  }
} 