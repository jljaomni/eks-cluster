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

# Variables para el VPC y Networking
variable "vpc_name" {
  description = "VPC Name"
  type        = string
}

variable "cidr_block" {
  description = "CIDR Block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "Public Subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  description = "Private Subnets"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "azs" {
  description = "Availability Zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

# Variables para el cluster EKS

variable "eks_cluster_name" {
  description = "Nombre del cluster EKS"
  type        = string
}

variable "ng_name" {    
  description = "Nombre del grupo de nodos"
  type        = string
}

variable "ng_instance_type" {    
  description = "Tipo de instancia del grupo de nodos"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "ng_desired_capacity" {    
  description = "Capacidad deseada del grupo de nodos"
  type        = number 
  default     = 2
}

variable "ng_max_capacity" {    
  description = "Capacidad maxima del grupo de nodos"
  type        = number 
  default     = 3
}

variable "ng_min_capacity" {    
  description = "Capacidad minima del grupo de nodos"
  type        = number 
  default     = 1
}

/* variable "ng_sg_name" {
  description = "Security Group del grupo de nodos"
  type        = string
}
 */
