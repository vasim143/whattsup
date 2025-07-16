module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 6.0"

  identifier           = "my-rds-instance"
  engine               = "mysql"
  engine_version       = "8.0.35"
  family               = "mysql8.0"
  major_engine_version = "8.0"         # <-- Add this line

  instance_class       = "db.t3.micro"
  allocated_storage    = 20
  storage_encrypted    = true

  db_name              = "akram"
  username             = "admin"
  password             = "akram12345"
  port                 = 3306

  publicly_accessible  = true

  vpc_security_group_ids = ["sg-07b862baaaabbfee1"]
  subnet_ids             = ["subnet-0ebb38fe434760260", "subnet-0c5fae1399f86766"]

  skip_final_snapshot    = true

  tags = {
    Environment = "Dev"
    Project     = "RDS Example"
  }
}
