provider "aws" {
  region = "ap-south-1"  # Set your desired region
}

module "app_instance" {
  source = "./app_module"

  count = 2  # Deploy two instances
}

output "app_instance_ips" {
  value = module.app_instance.private_ips
}
