resource "aws_ecs_cluster" "main" {
  name = "employee-platform-cluster"

  tags = {
    Name = "employee-platform-cluster"
  }
}