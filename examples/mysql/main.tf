module "mysql" {
  source = "./../../modules/mysql"

  connect_as_user = "root"
  host = "127.0.0.1"
  user = "test_user"
  database = "test_database"
}
