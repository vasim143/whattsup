
resource "aws_instance" "name" {
  ami           = "ami-0150ccaf51ab55a51"
  instance_type = "t2.micro"
  # key_name = "test"
}

resource "aws_s3_bucket" "name" {
  bucket = "bokkalolife54545"
}


#terraform plan -target="aws_s3_bucket.name"
#terraform apply -target="aws_s3_bucket.name"
# terraform plan --target=aws_instance