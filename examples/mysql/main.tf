locals {
  vault = "DevOps Tech"
}

module "mysql" {
  source = "./../../modules/mysql"

  endpoint           = "127.0.0.1"
  operating_user     = "root"
  operating_password = ""

  username = "test_user"
  database = "test_database"
}

module "one-password" {
  source = "./../../modules/one-password"

  service_account_token = var.service_account_token

  title    = "Test MySQL User"
  category = "database"
  vault    = local.vault
  tags     = ["database"]

  database_name            = module.mysql.database
  database_type            = "mysql"
  hostname                 = module.mysql.host
  port                     = module.mysql.port
  username                 = module.mysql.user
  password                 = module.mysql.password
  should_generate_password = false
}
