provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "file_example" {
  ami                    = "ami-020cba7c55df1f615"
  instance_type          = "t2.micro"
  subnet_id              = "subnet-0972f30572b973650"
  vpc_security_group_ids = ["sg-0d8a863784690ac12"]
  key_name               = "task1"

  connection {
  type        = "ssh"
  user        = "ubuntu"
  private_key = file("task1.pem")
  host        = self.public_ip
}

  provisioner "file" {
    source      = "${path.module}/file10"
    destination = "/home/ubuntu/file10"
  }

  tags = {
    Name = "file-provisioner"
  }
}
