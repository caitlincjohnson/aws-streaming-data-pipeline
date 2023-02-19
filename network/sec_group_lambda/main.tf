resource "aws_security_group" "sec_grp_lambda" {
  name        = "lambda-${terraform.workspace}"
  description = "Lambda Security Group"
  vpc_id      = var.vpc_id
  egress = [{
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all"
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }]

  tags = {
    "Name" = "${terraform.workspace}"
  }
}

resource "aws_security_group_rule" "lambda_postgres" {
  type                     = "ingress"
  from_port                = 5432
  to_port                  = 5432
  protocol                 = "tcp"
  security_group_id        = sec_group_rds.security_group_id
  source_security_group_id = aws_security_group.lambda_sec_group.id
}