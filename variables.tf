variable "access_key" {
  description = "AWS Access Key"
}

variable "secret_key" {
  description = "AWS Secret Key"
}

variable "aws_region" {
  description = "AWS Region"
  default     = "us-west-2"
}

variable "cidr_block" {
  description = "CIDR for the VPC"

  default = {
    dev = "10.20.0.0/16"
  }
}

variable "eks_cluster_name" {
  description = "EKS Cluster Name"
  default     = "terraform-project"
}

variable "identifier" {
  description = "Identifier for Database"
  default     = "terraform-db"
}

variable "storage_type" {
  description = "Type of the storage (SSD or Magnetic)"
  default     = "gp2"
}

variable "allocated_storage" {
  description = "Amount of Storage Allocated (GB)"

  default = {
    dev = "10"
  }
}

variable "db_engine" {
  description = "DB Engine Type"
  default     = "postgres"
}

# Decided to go with 12.11 since they use t2.micro
variable "engine_version" {
  description = "DB Engine Version"
  default     = "12.11"
}

variable "instance_class" {
  description = "Instance Class"

  default = {
    dev = "db.t2.micro"
  }
}

variable "db_username" {
  description = "Database Username"
  default     = "root"
}

variable "db_password" {
  description = "Database Password (tfvars file)"
}

variable "aws_profile" {
  description = "Terraform's AWS Profile"
  default     = "terraform-user"
}