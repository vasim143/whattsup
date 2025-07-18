resource "aws_vpc" "akram" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "akram"
  }
}

resource "aws_subnet" "public_a" {
  vpc_id                  = aws_vpc.akram.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "akram-public-a"
  }
}

resource "aws_subnet" "public_d" {
  vpc_id                  = aws_vpc.akram.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1d"
  map_public_ip_on_launch = true

  tags = {
    Name = "akram-public-d"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.akram.id

  tags = {
    Name = "akram-igw"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.akram.id

  tags = {
    Name = "akram-public-rt"
  }
}

resource "aws_route" "internet_access" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "assoc_public_a" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "assoc_public_d" {
  subnet_id      = aws_subnet.public_d.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_eip" "nat_eip" {
  domain = "vpc"

  tags = {
    Name = "akram-nat-eip"
  }
}


resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_a.id

  tags = {
    Name = "akram-nat"
  }
}

resource "aws_route_table" "nat_rt" {
  vpc_id = aws_vpc.akram.id

  tags = {
    Name = "akram-nat-rt"
  }
}

resource "aws_route" "nat_access" {
  route_table_id         = aws_route_table.nat_rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id
}

resource "aws_security_group" "custom_sg" {
  name        = "akram-sg"
  description = "Allow SSH, HTTP, HTTPS"
  vpc_id      = aws_vpc.akram.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
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
    Name = "akram-custom-sg"
  }
}

resource "aws_instance" "vasim" {
  ami                         = "ami-0150ccaf51ab55a51"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public_d.id
  vpc_security_group_ids      = [aws_security_group.custom_sg.id]
  associate_public_ip_address = true
  #key_name                    = "your-key-name"  # Replace with your valid key name

  user_data = file("${path.module}/userdata.sh")  # ✅ This line must be here

  tags = {
    Name = "vasim"
  }
}
