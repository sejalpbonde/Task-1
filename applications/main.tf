provider "aws" {
  region = "ap-south-1"  # Update with your desired region
}

module "app_instance" {
  source = "../modules/app"

  app_name = "testAPP1"
}

module "app_instance2" {
  source = "../modules/app"

  app_name = "testAPP2"
}
