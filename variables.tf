variable "aws_region" {
  description = "AWS Region"
  default     = "us-west-2"
}

variable "aws_profile" {
  description = "Terraform's AWS Profile"
  default     = "terraform-user"
}

variable "access_key" {
  description = "AWS Access Key"
}

variable "secret_key" {
  description = "AWS Secret Key"
}

variable "eks_cluster_name" {
  description = "EKS Cluster Name"
  default     = "aws-streaming-project"
}