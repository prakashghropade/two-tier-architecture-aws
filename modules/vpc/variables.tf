# VPC Module - variables

variable "project_name" {
  description = "Name of the project"
  type = string
}

variable "environment" {
  description = "Environment name"
  type = string  
}

variable "aws_region" {
  description = "AWS region"
  type = string
}

variable "vpc_cider" {
  description = "CIDR block for VPC"
  type = string
  default = "10.0.0.0/16"
}

variable "public_subnet_ciders" {
  description = "CIDER block for the public subnet"
  type = string
  default = "10.0.1.0/24"
}

variable "private_subnet_ciders" {
   description = "CIDER block for private subnets"
   type = list(string)
   default = [ "10.0.2.0/24", "10.0.3.0/24" ]
}