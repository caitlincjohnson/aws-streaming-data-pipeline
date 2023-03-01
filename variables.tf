variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-west-2"
}

variable "aws_profile" {
  description = "Terraform's AWS Profile"
  type        = string
  default     = "terraform-user"
}

variable "access_key" {
  description = "AWS Access Key"
  type        = string
}

variable "secret_key" {
  description = "AWS Secret Key"
  type        = string
}

variable "eks_cluster_name" {
  description = "EKS Cluster Name"
  type        = string
  default     = "aws-streaming-project"
}

variable "cidr_block" {
  description = "CIDR for the VPC"
  type        = string
  default     = "10.20.0.0/16"
}