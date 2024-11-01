provider "onepassword" {
  service_account_token = var.service_account_token
}

data "onepassword_vault" "default" {
  name = var.vault
}

locals {
  title = var.title

  tags = compact(concat([var.client_name], var.tags, var.database_type != "other" ? [var.database_type] : [""]))
}

resource "onepassword_item" "default" {
  vault = data.onepassword_vault.default.uuid

  title    = local.title
  category = var.category

  dynamic "password_recipe" {
    for_each = var.should_generate_password ? [""] : []
    content {
      length = 32
    }
  }
  password = var.should_generate_password ? null : var.password

  username = var.username
  url      = var.url

  database = var.database_name
  type     = var.database_type
  hostname = var.hostname
  port     = var.port

  dynamic "section" {
    for_each = var.section
    content {
      label = section.value.section_label

      dynamic "field" {
        for_each = section.value.fields
        content {
          label = field.value.label
          type  = field.value.type
          value = field.value.value
        }
      }
    }
  }

  tags = local.tags
}
