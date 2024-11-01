locals {
  client_name = lower(replace(var.client_name, "/\\W|_|\\s/", "-"))

  aws_creator = data.aws_caller_identity.current.arn

  cf_cdn_domain = coalesce(var.cf_cdn_domain, "cdn-${local.client_name}.somedomain.nl")

  cf_origin_access_control = "np-${local.client_name}-s3-cloudfront-oac"

  # https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/using-managed-cache-policies.html#managed-cache-caching-optimized
  cf_default_cache_behavior_cache_policy_id = "658327ea-f89d-4fab-a63d-7e88639e58f6"
  cf_default_cache_behavior_allowed_methods = ["GET", "HEAD"]
  cf_default_cache_behavior_cached_methods  = ["GET", "HEAD"]

  tags = merge({
    application = local.client_name
    nametag     = local.client_name
    creator     = local.aws_creator
  }, var.tags)
}

data "aws_caller_identity" "current" {}
