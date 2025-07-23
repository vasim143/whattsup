terraform {
  source = "../../../modules/ec2"
}

inputs = {
  ami               = "ami-0c55b159cbfafe1f0" # Ubuntu example
  instance_type     = "t2.micro"
  subnet_id         = "subnet-xxxxxxxx"
  security_group_id = "sg-xxxxxxxx"
  name              = "dev-ec2"
}
