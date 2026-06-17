resource "aws_ecr_repository" "employee_app" {
  name                 = "employee-platform-v2"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "employee-platform-v2"
  }
}