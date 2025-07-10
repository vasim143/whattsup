terraform {
  backend "s3" {
    bucket = "nareshitveeradevops"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
