provider "mysql" {
  endpoint = var.endpoint
  username = var.operating_user
  password = var.operating_password
}

locals {
  endpoint = var.endpoint
  host     = element(split(":", var.endpoint), 0)
  port     = element(split(":", var.endpoint), 1)
  user     = lower(replace(var.username, "/\\W/", "_"))
  database = lower(replace(var.database, "/\\W/", "_"))
}

resource "random_password" "default" {
  length           = 32
  special          = true
  override_special = "!#$%*()-_=+[]{}:?"
}

resource "mysql_database" "default" {
  default_character_set = var.default_character_set
  default_collation     = var.default_collation
  name                  = local.database
}

resource "mysql_user" "default" {
  user               = local.user
  host               = "%"
  plaintext_password = random_password.default.result
}

resource "mysql_grant" "default" {
  user       = mysql_user.default.user
  host       = mysql_user.default.host
  database   = mysql_database.default.name
  privileges = ["ALL"] # All privileges except "GRANT OPTION"
}
