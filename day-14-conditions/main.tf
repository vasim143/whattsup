provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "conditional_ec2" {
  count         = var.launch_instance ? 1 : 0
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "conditional-ec2"
  }
}
