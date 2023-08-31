resource "aws_instance" "app" {
  count = var.count

  ami           = "ami-0f5ee92e2d63afc18"  #TODO: Use the desired AMI ID 
  instance_type = "t2.micro"      # Use the desired instance type
  subnet_id     = var.subnet_id

  user_data = filebase64("${path.module}/../../scripts/deploy_app.sh")
}

output "private_ips" {
  value = aws_instance.app[*].private_ip
}

