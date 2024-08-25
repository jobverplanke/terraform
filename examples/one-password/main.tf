module "one-password" {
  source = "../../modules/one-password"

  service_account_token = ""

  client_name = "Test Client"

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
