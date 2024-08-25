module "mysql" {
  source = "./../../modules/mysql"

  connect_as_user = "root"
  host            = "127.0.0.1"
  user            = "test_user"
  database        = "test_database"
}

module "one-password" {
  source = "./../../modules/one-password"

  service_account_token = ""

  title    = "Test MySQL User"
  category = "database"
  vault    = "DevOps Tech"

  database_name = module.mysql.database
  database_type = "mysql"
  hostname      = module.mysql.host
  port          = module.mysql.port
  username      = module.mysql.user
  password      = module.mysql.password
}
