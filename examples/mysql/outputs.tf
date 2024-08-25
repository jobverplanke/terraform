output "user" {
  value       = module.mysql.user
  description = "MySQL user"
}

output "password" {
  value       = module.mysql.password
  description = "MySQL password"
  sensitive   = true
}

output "database" {
  value       = module.mysql.database
  description = "MySQL database"
}
