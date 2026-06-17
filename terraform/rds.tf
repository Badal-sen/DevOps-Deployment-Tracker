resource "aws_db_subnet_group" "main" {
  name = "employee-platform-db-subnet-group"

  subnet_ids = [
    aws_subnet.private_a.id,
    aws_subnet.private_b.id
  ]

  tags = {
    Name = "employee-platform-db-subnet-group"
  }
}

resource "aws_db_instance" "postgres" {
  identifier = "employee-platform-postgres-v2"

  engine         = "postgres"
  engine_version = "18.3"

  instance_class = "db.t3.micro"

  allocated_storage = 20
  storage_type      = "gp3"

  db_name  = "employees"
  username = "postgres"
  password = "ChangeMe123456!"

  publicly_accessible = false

  vpc_security_group_ids = [
    aws_security_group.rds_sg.id
  ]

  db_subnet_group_name = aws_db_subnet_group.main.name

  skip_final_snapshot = true

  tags = {
    Name = "employee-platform-postgres-v2"
  }
}