output "title_login" {
  value = local.is_login ? onepassword_item.login[0].title : null
}

output "title_password" {
  value = local.is_login ? onepassword_item.password[0].title : null
}

output "title_database" {
  value = local.is_login ? onepassword_item.database[0].title : null
}
