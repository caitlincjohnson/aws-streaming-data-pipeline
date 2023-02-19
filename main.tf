# Specify the Provider and Access Details
provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.aws_region
  profile    = var.aws_profile
}

## Network
# Create VPC
module "vpc" {
  source           = "./network/vpc"
  eks_cluster_name = var.eks_cluster_name
  cidr_block       = var.cidr_block
}

# Create Subnets
module "subnets" {
  source           = "./network/subnets"
  eks_cluster_name = var.eks_cluster_name
  vpc_id           = module.vpc.vpc_id
  vpc_cidr_block   = module.vpc.vpc_cidr_block
}

# Configure Routes
module "route" {
  source              = "./network/route"
  main_route_table_id = module.vpc.main_route_table_id
  gw_id               = module.vpc.gw_id

  subnets = flatten([
    "${module.subnets.subnets}",
  ])
}

module "eks_iam_roles" {
  source = "./eks/eks_iam_roles"
}

module "sec_group_eks" {
  source           = "./network/sec_group_eks"
  eks_cluster_name = var.eks_cluster_name
  vpc_id           = module.vpc.vpc_id
}

module "eks_cluster" {
  source           = "./eks/eks_cluster"
  eks_cluster_name = var.eks_cluster_name
  iam_cluster_arn  = module.eks_iam_roles.iam_cluster_arn
  iam_node_arn     = module.eks_iam_roles.iam_node_arn

  subnets = flatten([
    "${module.subnets.subnets}",
  ])

  security_group_cluster = module.sec_group_eks.security_group_cluster
}

module "sec_group_postgres" {
  source         = "./network/sec_group_postgres"
  vpc_id         = module.vpc.vpc_id
  vpc_cidr_block = module.vpc.vpc_cidr_block
}

module "postgres" {
  source = "./rds/postgres"

  subnets = flatten([
    "${module.subnets.subnets}",
  ])

  sec_grp_postgres  = module.sec_group_postgres.sec_grp_postgres
  identifier        = var.identifier
  storage_type      = var.storage_type
  allocated_storage = var.allocated_storage
  db_engine         = var.db_engine
  engine_version    = var.engine_version
  instance_class    = var.instance_class
  db_username       = var.db_username
  db_password       = var.db_password
}

# module "sec_group_lambda" {
#   source         = "./network/sec_group_lambda"
#   vpc_id         = module.vpc.vpc_id
#   vpc_cidr_block = module.vpc.vpc_cidr_block
# }

# module "lambda" {
#   source = "./lambda"

#   db_username = var.db_username
#   db_password = var.db_password

# }