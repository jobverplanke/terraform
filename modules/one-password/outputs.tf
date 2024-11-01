output "vault" {
  value = data.onepassword_vault.default.name
}

output "title" {
  value = onepassword_item.default.title
}
