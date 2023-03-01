# Create a VPC to Deploy Instances
data "aws_availability_zones" "available" {}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  enable_dns_hostnames = true
  enable_dns_support   = true

  instance_tenancy = "default"
  lifecycle {
    create_before_destroy = true
  }

  tags = (tomap({
    "Name"                                          = "terraform-eks-${terraform.workspace}",
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared",
  }))

}

# Create an internet gateway to give our subnet
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "aws-streaming-project"
  }
}

# Create dhcp option setup
resource "aws_vpc_dhcp_options" "main" {
  domain_name         = "us-west-2.compute.internal"
  domain_name_servers = ["AmazonProvidedDNS"]

  tags = {
    Name = "aws-streaming-project"
  }
}