provider "aws" {    
    region = var.region
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

/* provider "kubernetes" {
  config_path = "~/.kube/config" # O puedes definir las credenciales del cluster directamente.
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

 */