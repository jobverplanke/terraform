locals {
  client_name = "Test Client Name"
}

module "cloudfront" {
  source = "./../../modules/cloudfront"

  client_name = local.client_name

  s3_bucket_id = ""
  s3_bucket_name = ""
  s3_bucket_regional_domain_name = ""
}
