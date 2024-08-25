module "rds" {
  source = "./../../modules/rds"

  client_name = "test client"
}

# module "mysql" {
#   source = "./../../modules/mysql"
#
#   client_name = "MakeSomeNoise"
#   connect_as_user = module.rds.username
#   host = module.rds.host
#   user = module.rds.port
#   database = ""
# }
