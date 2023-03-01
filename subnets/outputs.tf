output "aws_subnet_id" {
  value = aws_subnet.external.*.id
}