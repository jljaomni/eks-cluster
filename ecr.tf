# Crear un repositorio en ECR
resource "aws_ecr_repository" "this" {
  name                 = var.image_service   
  image_tag_mutability = "MUTABLE"            
  image_scanning_configuration {
    scan_on_push = true  
  }

  tags = var.tags
}


