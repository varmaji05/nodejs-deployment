resource "aws_secretsmanager_secret" "db_creds" {
  name = "${var.project}-db-creds"
}

resource "aws_secretsmanager_secret_version" "db_creds_version" {
  secret_id     = aws_secretsmanager_secret.db_creds.id
  secret_string = jsonencode({
    username = var.db_username
    password = var.db_password
  })
}
