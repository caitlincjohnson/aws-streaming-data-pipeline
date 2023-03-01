# Specify the Provider and Access Details
provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

data "aws_availability_zones" "available" {}

module "vpc" {
  source           = "./vpc"
  eks_cluster_name = var.eks_cluster_name
}