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
    Project     = "mi-proyecto"
  }
}
