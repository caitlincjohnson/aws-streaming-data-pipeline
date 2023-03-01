# Specify the Provider and Access Details
provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

data "aws_availability_zones" "available" {}

module "vpc" {
  source           = "./vpc"
  eks_cluster_name = var.eks_cluster_name
  cidr_block       = var.cidr_block
}

module "subnets" {
  source           = "./subnets"
  eks_cluster_name = var.eks_cluster_name
  vpc_id           = module.vpc.vpc_id
  vpc_cidr_block   = module.vpc.vpc_cidr_block
}