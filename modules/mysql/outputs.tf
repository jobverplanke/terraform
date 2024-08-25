output "user" {
  value = mysql_user.default.user
  description = "MySQL username"
}

output "password" {
  value = random_password.default.result
  description = "MySQL password"
  sensitive = true
}

output "database" {
  value = mysql_database.default.name
  description = "MySQL database"
}
