resource "aws_ecr_repository" "app" {
  name                 = "${var.project}-app"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "${var.project}-ecr"
  }
}

data "aws_caller_identity" "current" {}

resource "aws_ssm_parameter" "docker_image_uri" {
  name  = "/app/docker/image"
  type  = "String"
  value = "${data.aws_caller_identity.current.account_id}.dkr.ecr.${var.region}.amazonaws.com/${aws_ecr_repository.app.name}:latest"
  overwrite = true
}
