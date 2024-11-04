resource "aws_cloudfront_distribution" "default" {
  # aliases             = [local.cf_cdn_domain]
  enabled             = true
  is_ipv6_enabled     = true
  wait_for_deployment = true
  http_version        = "http2and3"

  tags = local.tags

  origin {
    domain_name              = var.s3_bucket_regional_domain_name
    origin_id                = var.s3_bucket_name
    origin_access_control_id = aws_cloudfront_origin_access_control.default.id
  }

  # For cache_policy_id
  # https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/using-managed-cache-policies.html#managed-cache-caching-optimized
  default_cache_behavior {
    cache_policy_id        = local.cf_default_cache_behavior_cache_policy_id
    allowed_methods        = local.cf_default_cache_behavior_allowed_methods
    cached_methods         = local.cf_default_cache_behavior_cached_methods
    target_origin_id       = var.s3_bucket_name
    viewer_protocol_policy = "redirect-to-https"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
    minimum_protocol_version       = "TLSv1.2_2021"
  }
}


# Create OAC for CloudFront to send authenticated requests to S3 bucket
resource "aws_cloudfront_origin_access_control" "default" {
  name                              = local.cf_origin_access_control
  description                       = "Allow read-only access to a CloudFront OAC"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}
