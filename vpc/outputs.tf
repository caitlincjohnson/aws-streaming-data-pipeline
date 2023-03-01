output "vpc_id" {
  value = aws_vpc.main.id
}

output "aws_internet_gateway_id" {
  value = aws_internet_gateway.main.id
}

output "dhcp_option_id" {
  value = aws_vpc_dhcp_options.main.id
}

output "vpc_cidr_block" {
  value = aws_vpc.main.cidr_block
}