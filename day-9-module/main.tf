resource "aws_instance" "name" {
  ami               = var.ami_id
  instance_type     = var.instance_type
  #key_name          = var.key
  availability_zone = var.az

  tags = {
    Name = "dev-instance"
  }
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
  acl    = "private"

  tags = {
    Name        = var.bucket_name
    Environment = "Dev"
  }
}
