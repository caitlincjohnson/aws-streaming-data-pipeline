# Security Group to allow Lambda to communicate
resource "aws_lambda_function" "lambda_postgres_init" {
  code_signing_config_arn = ""
  description             = "Lambda function to initialize Postgres"
  filename                = var.archive_file.lambda.output_path
  function_name           = "${terraform.workspace}-init-postgres-function"
  role                    = data.aws_iam_role.basic_lambda.arn
  handler                 = "initdb.lambda_handler"
  runtime                 = "python3.8"
  source_code_hash        = filebase64sha256(data.archive_file.lambda.output_path)
  timeout                 = 180

  vpc_config {
    subnet_ids         = data.aws_subnet_ids.intra_subnets_id.ids
    security_group_ids = [module.sec_grp_lambda.security_group_id]
  }

  environment {
    variables = {
      APP_DB_USER = "${var.database_user}"
      APP_DB_PASS = "${var.database_password}"
      APP_DB_NAME = "postgres"
      DB_HOST     = aws_db_instance.postgres.address
      DB_NAME     = aws_db_instance.postgres.name
      ENV         = "${var.env}"
      PROJECT     = "${var.project}"
    }
  }

}