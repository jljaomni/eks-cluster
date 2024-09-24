output "github_actions_role_arn" {
  description = "ARN del rol IAM creado para GitHub Actions"
  value       = aws_iam_role.github_actions_role.arn
}

# Output para obtener el nombre del repositorio
output "ecr_repository_name" {
  description = "Nombre del repositorio ECR"
  value       = aws_ecr_repository.this.name
}

# Output para obtener la URL del repositorio ECR
output "ecr_repository_url" {
  description = "URL del repositorio ECR"
  value       = aws_ecr_repository.this.repository_url
}

output "s3_bucket_name" {
  value = aws_s3_bucket.terraform_state.bucket
}

output "dynamodb_table_name" {
  value = aws_dynamodb_table.terraform_locks.name
}

output "dynamodb_table_arn" { 
  value = aws_dynamodb_table.terraform_locks.arn
}
