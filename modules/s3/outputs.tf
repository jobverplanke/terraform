output "s3_bucket_region" {
  value       = aws_s3_bucket.default.region
  description = "S3 Bucket region"
}

output "s3_bucket_id" {
  value       = aws_s3_bucket.default.id
  description = "ID of S3 Bucket"
}

output "s3_bucket_arn" {
  value       = aws_s3_bucket.default.arn
  description = "S3 bucket ARN"
}

output "s3_bucket_name" {
  value       = aws_s3_bucket.default.bucket
  description = "Name of S3 Bucket"
}

output "s3_bucket_domain_name" {
  value       = aws_s3_bucket.default.bucket_domain_name
  description = "S3 Bucket domain name"
}

output "s3_bucket_regional_domain_name" {
  value       = aws_s3_bucket.default.bucket_regional_domain_name
  description = "S3 Bucket regional domain name"
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
