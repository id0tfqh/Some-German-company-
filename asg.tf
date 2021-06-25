resource "aws_autoscaling_group" "something-application" {
  name                 = "node-application"
  max_size             = 10
  min_size             = 2
  desired_capacity     = 3
  launch_configuration = aws_launch_configuration.asg-application.name
  availability_zones   = [var.aZone]
  force_delete         = false

  lifecycle {
    create_before_destroy = true
  }

}

resource "aws_launch_configuration" "asg-application" {
  image_id             = data.aws_ami.latest.id
  instance_type        = var.instanceType
  enable_monitoring    = "true"
  name                 = "node-application-"
  security_groups      = [aws_security_group.target.id,
    aws_security_group.control.id,
    aws_security_group.public.id,
    aws_security_group.db.id]
  user_data            = file("bootstrap.sh")

  lifecycle {
    create_before_destroy = true
  }
}
