provider "aws" {
  region = "ap-south-1"  # Update with your desired region
}

resource "aws_instance" "proxy_instance" {
  ami           = "ami-0f5ee92e2d63afc18"  # Update with your desired AMI
  instance_type = "t2.micro"
  key_name      = aws_key_pair.generated_key.key_name

  tags = {
    Name = "proxy"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install -y nginx",
      "sudo rm /etc/nginx/sites-enabled/default",
      "sudo mv /tmp/nginx.conf /etc/nginx/sites-available/app.conf",
      "sudo ln -s /etc/nginx/sites-available/app.conf /etc/nginx/sites-enabled/app.conf",
      "sudo systemctl restart nginx",
    ]
  }

  provisioner "file" {
    content     = file("nginx.conf")
    destination = "/tmp/nginx.conf"
  }
}

resource "aws_key_pair" "generated_key" {
  key_name   = "proxykey"
  public_key = file("~/.ssh/id_rsa.pub")
}
