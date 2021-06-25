/* */
resource "aws_db_instance" "something-db" {
  engine                     = "mysql"
  engine_version             = "8.0.23"
  instance_class             = var.instanceTypeDB
  name                       = "testdb"
  username                   = "kdlkfg"
  password                   = "djfhkdjhgk564654sfsdfsdf"
  allocated_storage          = 20
  max_allocated_storage      = 30
  availability_zone          = var.aZone
  deletion_protection        = true
  parameter_group_name       = "default.mysql8.0"
  skip_final_snapshot        = true
  maintenance_window         = "Tue:04:00-Tue:06:00"
  backup_window              = "01:00-03:30"
  backup_retention_period    = 7
  db_subnet_group_name       = aws_db_subnet_group.one.name
  vpc_security_group_ids     = [aws_security_group.db.id]
  auto_minor_version_upgrade = false
  multi_az                   =  false
  
  tags = {
    Name = "something"
    Project = "Super project"
  }

}

resource "aws_db_subnet_group" "one" {
  name       = "database"
  subnet_ids = [aws_subnet.sgc-subnet.id]

  tags = {
    Name = "something"
    Project = "Super project"
  }
}
