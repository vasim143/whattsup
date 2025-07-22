terraform {
  backend "s3" {
    bucket = "universalglobalsunmoon"
    key    = "prod/terraform.tfstate"
    region = "us-east-1"
  }
}
