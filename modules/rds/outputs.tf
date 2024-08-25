output "host" {
  value = aws_db_instance.default.address
  description = "RDS MySQL hostname"
}

output "port" {
  value = aws_db_instance.default.port
  description = "RDS MySQL port number"
}

output "root_user" {
  value = aws_db_instance.default.username
  description = "RDS MySQL username"
}

output "root_user_password" {
  value = aws_db_instance.default.password
  description = "RDS MySQL password"
  sensitive = true
}

output "access_key" {
  value = aws_iam_access_key.default.id
  description = "IAM Access Key"
  sensitive = true
}

output "access_key_secret" {
  value = aws_iam_access_key.default.secret
  description = "IAM Access Key Secret"
  sensitive = true
}
