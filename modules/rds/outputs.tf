output "rds_endpoint" {
  value       = aws_db_instance.default.endpoint
  description = "RDS MySQL endpoint (host + port)"
}

output "rds_host" {
  value       = aws_db_instance.default.address
  description = "RDS MySQL hostname"
}

output "rds_port" {
  value       = aws_db_instance.default.port
  description = "RDS MySQL port number"
}

output "rds_root_user" {
  value       = aws_db_instance.default.username
  description = "RDS MySQL username"
}

output "rds_root_user_password" {
  value       = aws_db_instance.default.password
  description = "RDS MySQL password"
  sensitive   = true
}

output "iam_user" {
  value       = aws_iam_user.default.name
  description = "IAM User for S3 bucket"
}

output "iam_access_key" {
  value       = aws_iam_access_key.default.id
  description = "IAM Access Key"
  sensitive   = true
}

output "iam_access_key_secret" {
  value       = aws_iam_access_key.default.secret
  description = "IAM Access Key Secret"
  sensitive   = true
}
