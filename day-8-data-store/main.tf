# Data source to find subnet by tag "Name = dev-subnet"
data "aws_subnet" "selected" {
  filter {
    name   = "tag:Name"
    values = ["dev-subnet"]  # Replace with your actual subnet tag value
  }
}

# Data source to find latest Amazon Linux 2 AMI
data "aws_ami" "amzlinux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-gp2"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

resource "aws_instance" "example" {
  ami           = data.aws_ami.amzlinux.id
  instance_type = "t2.micro"
  subnet_id     = data.aws_subnet.selected.id

  tags = {
    Name = "ExampleInstance"
  }
}
