resource "aws_instance" "main" {
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  #key_name      = var.key_name
  subnet_id     = element(var.subnet_ids, count.index % length(var.subnet_ids))
  vpc_security_group_ids = var.security_group_ids

  tags = {
    Name = "terraform-ec2-${count.index + 1}"
  }
}
