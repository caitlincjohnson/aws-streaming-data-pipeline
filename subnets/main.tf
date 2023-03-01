# Create external-facing subnets in us-west-2
data "aws_availability_zones" "available" {}

resource "aws_subnet" "external" {
  count                   = length(data.aws_availability_zones.available.names)
  cidr_block              = cidrsubnet(var.vpc_cidr_block, 8, count.index)
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  vpc_id                  = var.vpc_id
  map_public_ip_on_launch = true

  tags = (tomap({
    "Name"                                          = "${var.eks_cluster_name}",
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared",
  }))
}