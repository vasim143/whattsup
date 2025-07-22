terraform {
  backend "s3" {
    bucket         = "universalglobalsunmoon"
    key            = "dev/terraform.tfstate"  # state file path inside bucket
    region         = "us-east-1"              # replace with your region
    dynamodb_table = "terraform-lock-table"   # for state locking
    encrypt        = true
  }
}
