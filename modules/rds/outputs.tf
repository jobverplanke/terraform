output "host" {
  value = aws_db_instance.default.address
  description = "RDS MySQL hostname"
}

output "port" {
  value = aws_db_instance.default.port
  description = "RDS MySQL port number"
}

output "username" {
  value = aws_db_instance.default.username
  description = "RDS MySQL username"
}

output "password" {
  value = aws_db_instance.default.password
  description = "RDS MySQL password"
  sensitive = true
}
