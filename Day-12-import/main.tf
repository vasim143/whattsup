resource "aws_instance" "imported_instance" {
  # Minimal configuration for import; real config will be updated later
  ami           = "ami-i-0fa59084e3b2671bc"
  instance_type = "t3.micro"

  tags = {
    Name = "import"
  }
}