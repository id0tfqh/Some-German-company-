/* S3 bucket description */
resource "aws_s3_bucket" "backup-files" {
  bucket = "backup-data"
  acl    = "private"
  versioning {
      enabled = true
  }
  tags = {
    Name = "something"
    Project = "Super project"
  }
}