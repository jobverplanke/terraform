provider "mysql" {
  endpoint = local.endpoint
  username = var.connect_as_user
}

locals {
  endpoint = "${var.host}:${var.port}"
  user     = lower(replace(var.user, "/\\W/", "_"))
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
