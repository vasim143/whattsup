resource "aws_vpc" "name" {
cidr_block = "10.1.0.0/16"
tags = {
  Name = "itsokay"
}
  resource "aws_vpc" "name1"{
    cidr_block = "10.0.1.0/16"
     tags = {
        Name = "vpctest"
     }
  }
}