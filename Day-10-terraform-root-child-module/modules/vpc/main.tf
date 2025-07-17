resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidr_blocks[0]
  availability_zone = var.availability_zones[0]
  tags = {
    Name = "${var.vpc_name}-subnet-1"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidr_blocks[1]
  availability_zone = var.availability_zones[1]
  tags = {
    Name = "${var.vpc_name}-subnet-2"
  }
}
