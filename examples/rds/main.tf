locals {
  client_name = "test client"
}

module "rds" {
  source = "./../../modules/rds"

  client_name = local.client_name
}

module "mysql" {
  source = "./../../modules/mysql"

  connect_as_user = module.rds.root_user
  host            = module.rds.host
  port            = module.rds.port

  user     = "test_user"
  database = "test_database"
}
