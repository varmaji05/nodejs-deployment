resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "db-subnet-group"
  subnet_ids = values(aws_subnet.private)[*].id
  tags = {
    Name = "db-subnet-group"
  }
}

resource "aws_db_instance" "postgres" {
  identifier              = "postgres-db"
  engine                  = "postgres"
  instance_class          = "db.t3.micro"
  allocated_storage       = 20
  storage_type            = "gp2"
  username                = jsondecode(aws_secretsmanager_secret_version.db_creds_version.secret_string)["username"]
  password                = jsondecode(aws_secretsmanager_secret_version.db_creds_version.secret_string)["password"]
  db_subnet_group_name    = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids  = [aws_security_group.db_sg.id]
  publicly_accessible     = false
  skip_final_snapshot     = true
  backup_retention_period = 0
  multi_az                = false

  tags = {
    Name = "postgres-db"
  }
}
