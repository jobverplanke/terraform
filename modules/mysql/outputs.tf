output "user" {
  value       = mysql_user.default.user
  description = "MySQL user"
}

output "password" {
  value       = random_password.default.result
  description = "MySQL password"
  sensitive   = true
}

output "endpoint" {
  value       = local.endpoint
  description = "MySQL endpoint (host + port)"
}

output "host" {
  value       = local.host
  description = "MySQL host"
}

output "port" {
  value       = local.port
  description = "MySQL port"
}

output "database" {
  value       = mysql_database.default.name
  description = "MySQL database"
}
