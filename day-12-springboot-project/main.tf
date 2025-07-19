
# Create a Security Group for EC2 instances
resource "aws_security_group" "ec2_sg" {
  name        = "ec2-sg"
  description = "Allow SSH, frontend(3000), backend(8080)"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Frontend port"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Backend port"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ec2-sg"
  }
}

# Launch Backend EC2
module "backend" {
  source            = "./modules/ec2"
  instance_name     = "backend-server"
  ami_id            = var.ami_id
  subnet_id         = var.subnet_2
  key_name          = var.key_name
  security_group_id = aws_security_group.ec2_sg.id
  user_data         = file("${path.module}/user_data/backend.sh")
}

# Launch Frontend EC2
module "frontend" {
  source            = "./modules/ec2"
  instance_name     = "frontend-server"
  ami_id            = var.ami_id
  subnet_id         = var.subnet_1
  key_name          = var.key_name
  security_group_id = aws_security_group.ec2_sg.id
  user_data         = file("${path.module}/user_data/frontend.sh")
}

# Launch RDS MySQL instance
module "rds" {
  source             = "./modules/rds"
  allocated_storage  = 20
  engine_version     = "8.0"
  instance_class     = "db.t3.micro"
  db_name            = var.rds_db_name
  username           = var.rds_username
  password           = var.rds_password
  subnet_ids         = [var.subnet_1, var.subnet_2]
  vpc_id             = var.vpc_id
}
