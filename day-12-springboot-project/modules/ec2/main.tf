resource "aws_instance" "this" {
  ami                    = var.ami_id
  instance_type          = "t2.micro"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  key_name               = var.key_name

  user_data = var.user_data

  tags = {
    Name = var.instance_name
  }
}
