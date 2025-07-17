locals {
  sanitized_rds_name = replace(lower(var.rds_name), " ", "-")
}




resource "aws_security_group" "rds_sg" {
  name   = "${var.rds_name}-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "${var.rds_name}-subnet-group"
  subnet_ids = var.subnet_ids
}

resource "aws_db_instance" "rds" {
  identifier             = local.sanitized_rds_name
  allocated_storage      = 20
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  username               = var.username
  password               = var.password
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  skip_final_snapshot    = true

  tags = {
    Name = var.rds_name  # You can keep the original here
  }
}
