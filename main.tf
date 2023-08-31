module "app_instances" {
  source   = "./applications"
  app_name = "testAPP1"
}

module "app_instance2" {
  source   = "./applications"
  app_name = "testAPP2"
}

module "proxy_instance" {
  source = "./proxy"
}
#hello