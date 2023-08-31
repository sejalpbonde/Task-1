resource "aws_instance" "proxy" {
  ami           = "ami-0f5ee92e2d63afc18"  #TODO: Use the desired AMI ID
  instance_type = "t2.micro"      # Use the desired instance type
  subnet_id     = var.subnet_id

  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y nginx

              cat <<EOF > /etc/nginx/sites-available/app_proxy
              server {
                listen 80;
                server_name _;

                location /testAPP1 {
                  proxy_pass http://${module.app_instance.private_ips[0]}:80;  # Change this IP to the actual IP of APP1 instance
                }
              }
              

              ln -s /etc/nginx/sites-available/app_proxy /etc/nginx/sites-enabled/
              service nginx restart
              EOF
}

output "public_ip" {
  value = aws_instance.proxy.public_ip
}
