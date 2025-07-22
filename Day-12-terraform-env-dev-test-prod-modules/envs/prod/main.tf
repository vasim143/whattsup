resource "aws_instance" "this" {
  ami           = "ami-0abcdef1234567890"  # Replace with a valid Ubuntu AMI ID for your region
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name = "${var.environment}-ec2"
  }
}
