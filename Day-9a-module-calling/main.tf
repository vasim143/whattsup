

module "project" {
  source        = "../day-9-module"
  ami_id        = "ami-0150ccaf51ab55a51"     # ✅ Make sure this AMI ID exists and is public/shared
  instance_type = "t2.micro"
  key           = ""                          # Empty or comment out if not using key
  az            = "us-east-1a"
  bucket_name   = "bokkalolife4343556644"     # ✅ Must be globally unique
}
