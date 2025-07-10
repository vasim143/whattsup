terraform {
  backend "s3" {
    bucket = "nareshitveeradevops"
    key    = "terraform.tfstate"
    region = "us-east-1"
    object_lock_enabled = true
  }
}
