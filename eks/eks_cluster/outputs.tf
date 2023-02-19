output "eks_certificate_authority" {
  value = aws_eks_cluster.terraform-project.certificate_authority.0.data
}

output "eks_endpoint" {
  value = aws_eks_cluster.terraform-project.endpoint
}

output "eks_cluster_name" {
  value = aws_eks_cluster.terraform-project.name
}