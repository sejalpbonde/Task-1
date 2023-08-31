provider "aws" {
  region = "ap-south-1"  
}

module "proxy_instance" {
  source = "./proxy_module"
}

output "proxy_ip" {
  value = module.proxy_instance.public_ip
}
