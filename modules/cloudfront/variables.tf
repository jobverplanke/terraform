variable "region" {
  type        = string
  default     = "eu-west-1"
  description = "(default eu-west-1)"
}

variable "client_name" {
  type        = string
  description = "Name of the client"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A mapping of tags to assign to various services"
}

variable "cf_cdn_domain" {
  type        = string
  default     = ""
  description = "CDN domain or sub-domain (default empty string)"
}

variable "s3_bucket_id" {
  type        = string
  description = "S3 Bucket ID"
}

variable "s3_bucket_arn" {
  type        = string
  description = "S3 Bucket ARN"
}

variable "s3_bucket_name" {
  type        = string
  description = "S3 Bucket name"
}

variable "s3_bucket_regional_domain_name" {
  type        = string
  description = "S3 Bucket regional domain name"
}
