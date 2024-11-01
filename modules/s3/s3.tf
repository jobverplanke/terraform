resource "aws_s3_bucket" "default" {
  bucket = local.s3_bucket_name
  tags   = local.tags
}
