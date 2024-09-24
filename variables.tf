variable "access_key" {
  description = "access_key"
  type        = string
  sensitive   = true
}
variable "secret_key" {
  description = "secret_key"
  type        = string
  sensitive   = true
}

variable "image_service" {
  description = "image_service"
  type        = string
}

variable "tags" {
  description = "Etiquetas comunes para aplicar a todos los recursos"
  type        = map(string)
  default = {
    Environment = "production"
    Project     = "omni-magento2"
    Terraform   = "true"
    Owner       = "jljaomni"
    Company     = "omni"
  }
}

variable "region" {
  description = "Región AWS"
  type        = string
  default     = "us-east-1"
}

variable "s3_bucket_name" {
  description = "Nombre del bucket S3 donde se almacenará el estado de Terraform"
  default     = "terraform-state-bucket-omni"
}

variable "dynamodb_table_name" {
  description = "Nombre de la tabla DynamoDB para el bloqueo de estados"
  default     = "terraform-state-locks-omni"
}