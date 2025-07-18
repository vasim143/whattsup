terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "local" {}  # You can change this to S3 backend later for team use
}

resource "aws_s3_bucket" "workspace_bucket" {
  bucket = "bokkalolife565656-${terraform.workspace}"
  acl    = "private"

  tags = {
    Name        = "Workspace bucket for ${terraform.workspace}"
    Environment = terraform.workspace
  }
}
