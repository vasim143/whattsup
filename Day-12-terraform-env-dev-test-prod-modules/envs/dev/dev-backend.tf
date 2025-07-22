terraform {
  backend "s3" {
    bucket         = "universalglobalsunmoon"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
   # dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}
