provider "aws" {
  region = "us-east-1"
}

# Local values (instead of variables and tfvars)
locals {
  ami_id        = "ami-05ffe3c48a9991133"
  instance_type = "t2.micro"
  key_name      = "CHENNAI"
  tag_name      = "vachesa"
}

resource "aws_instance" "example" {
  ami           = local.ami_id
  instance_type = local.instance_type
  key_name      = local.key_name

  tags = {
    Name = local.tag_name
  }
}
