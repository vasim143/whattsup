# Define local values
locals {
  project_name = "akram-project"
  instance_type = "t3.micro"
  tags = {
    Environment = "dev"
    Owner       = "akram"
  }
}

# Create VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "${local.project_name}-vpc"
  }
}

# Create EC2 instance using locals
resource "aws_instance" "web" {
  ami           = "ami-0150ccaf51ab55a51"
  instance_type = local.instance_type

  subnet_id = aws_subnet.public.id

  tags = merge(local.tags, {
    Name = "${local.project_name}-web"
  })
}

# Subnet for EC2
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "${local.project_name}-subnet"
  }
}
