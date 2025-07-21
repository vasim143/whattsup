resource "aws_db_subnet_group" "main" {
  name       = "terraform-db-subnet-group"
  subnet_ids = var.subnet_ids
  tags = {
    Name = "terraform-db-subnet-group"
  }
}



resource "aws_db_instance" "main" {
  allocated_storage    = var.allocated_storage
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.db_instance_class
  db_name              = var.db_name
  username             = var.db_username
  password             = var.db_password
  db_subnet_group_name = aws_db_subnet_group.main.name
  vpc_security_group_ids = var.vpc_security_group_ids

  skip_final_snapshot = true

  tags = {
    Name = "terraform-rds-instance"
  }
}
