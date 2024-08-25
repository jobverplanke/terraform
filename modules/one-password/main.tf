provider "onepassword" {
  service_account_token = var.service_account_token
}

data "onepassword_vault" "default" {
  name = var.vault
}

locals {
  title = var.client_name != null ? "${var.title} - ${var.client_name}" : var.title

  is_login    = var.category == "login"
  is_password = var.category == "password"
  is_database = var.category == "database"

  tags = concat([var.client_name], var.tags)
}

resource "onepassword_item" "login" {
  count = local.is_login ? 1 : 0

  vault = data.onepassword_vault.default.uuid

  title    = local.title
  category = var.category

  url      = var.url
  username = var.username
  password = var.password

  password_recipe {
    length = 32
  }

  tags = local.tags
}

resource "onepassword_item" "password" {
  count = local.is_password ? 1 : 0

  vault = data.onepassword_vault.default.uuid

  title    = local.title
  category = var.category

  password = var.password

  password_recipe {
    length = 32
  }

  tags = local.tags
}

resource "onepassword_item" "database" {
  count = local.is_database ? 1 : 0

  vault = data.onepassword_vault.default.uuid

  title    = local.title
  category = var.category

  password_recipe {
    length = 32
  }

  database = var.database_name
  type     = var.database_type
  hostname = var.hostname
  port     = var.port
  username = var.username
  password = var.password

  tags = concat(local.tags, [var.database_type])
}
