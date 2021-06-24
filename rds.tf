/* */
resource "aws_db_instance" "something-db" {
  engine                     = "mysql"
  engine_version             = "8.0.23"
  instance_class             = "${var.instanceTypeDB}"
  name                       = "test-db"
  username                   = "kdlkfg"
  password                   = "djfhkdjhgk564654sfsdfsdf"
  allocated_storage          = 50
  max_allocated_storage      = 10000
  availability_zone          = "${var.aZone}"
  deletion_protection        = true
  parameter_group_name       = "default.mysql5.7"
  skip_final_snapshot        = true
  maintenance_window         = "Tue:04:00-Tue:06:00"
  backup_window              = "01:00-03:30"
  backup_retention_period    = 7
  vpc_security_group_ids     = ["${aws_security_group.db.id}"]
  auto_minor_version_upgrade = false

  tags = {
    Name = "something"
    Project = "Super project"
  }

}
