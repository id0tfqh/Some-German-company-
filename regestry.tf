/* Regestry for docker image */
resource "aws_ecr_repository" "some-Germany-company" {
  name                 = "test_profile"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "node"
    Project = "Super project"
  }
}