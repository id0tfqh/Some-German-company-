/* */
resource "aws_db_instance" "something-db" {
  allocated_storage    = 100
  engine               = "mysql"
  engine_version       = "8.0.23"
  instance_class       = "db.m5.large"
  name                 = "test-db"
  username             = "kdlkfg"
  password             = "djfhkdjhgk564654sfsdfsdf"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true

  tags = {
    Name = "something"
    Project = "Super project"
  }

}
