variable "app_name" {}

resource "aws_instance" "app_instance" {
  ami           = "ami-0f5ee92e2d63afc18" # Update with your desired AMI
  instance_type = "t2.micro"
  key_name      = aws_key_pair.generated_key.key_name

  tags = {
    Name = var.app_name
  }

  provisioner "file" {
    source      = "app_files/${var.app_name}"
    destination = "/home/ubuntu/${var.app_name}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install -y nodejs npm",
      "cd /home/ubuntu/${var.app_name}",
      "npm install",
      "node index.js &",
    ]
  }
}

resource "aws_key_pair" "generated_key" {
  key_name   = "appkey"
  public_key = file("~/.ssh/id_rsa.pub")
}

