provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "remote_exec" {
  ami                    = "ami-020cba7c55df1f615"
  instance_type          = "t2.micro"
  subnet_id              = "subnet-002146029d98b302f"
  vpc_security_group_ids = ["sg-0d8a863784690ac12"]
  key_name               = "task1"
  
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("${path.module}/../task1.pem")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install nginx -y",
      "echo '<h1>Provisioned via remote-exec</h1>' | sudo tee /var/www/html/index.html"
    ]
  }

  tags = {
    Name = "remote-exec"
  }
}
