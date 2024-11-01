locals {
  service_account_token = ""
  client_name           = "Test Client Name"
  vault                 = "DevOps Tech"
  project_type          = "web"
}

module "s3" {
  source = "./../../modules/s3"

  client_name  = local.client_name
  project_type = local.project_type
}

module "cloudfront" {
  source = "./../../modules/cloudfront"

  client_name = local.client_name

  s3_bucket_id = module.s3.s3_bucket_id
  s3_bucket_name = module.s3.s3_bucket_name
  s3_bucket_regional_domain_name = module.s3.s3_bucket_regional_domain_name
}

# Store RDS Snapshot user in 1Password
module "one-password-iam-user" {
  source = "./../../modules/one-password"

  service_account_token = local.service_account_token

  client_name = local.client_name
  title       = "${local.client_name} - S3 Bucket"
  category    = "login"
  vault       = local.vault
  tags        = ["s3", "aws"]
  should_generate_password = false

  # https://registry.terraform.io/providers/1Password/onepassword/latest/docs/resources/item#nested-schema-for-sectionfield
  section = [
    {
      section_label = "IAM User"
      fields = [
        {
          label = "IAM User"
          type  = "STRING"
          value = module.s3.iam_user
        },
        {
          label = "Access Key ID"
          type  = "STRING"
          value = module.s3.iam_access_key
        },
        {
          label = "Access Key Secret"
          type  = "CONCEALED"
          value = module.s3.iam_access_key_secret
        }
      ]
    },
    {
      section_label = "Bucket"
      fields = [
        {
          label = "Region"
          type  = "STRING"
          value = module.s3.s3_bucket_region
        },
        {
          label = "Name"
          type  = "STRING"
          value = module.s3.s3_bucket_name
        },
        {
          label = "Domain name"
          type  = "STRING"
          value = module.s3.s3_bucket_regional_domain_name
        }
      ]
    },
    {
      section_label = "Cloudfront"
      fields = [
        {
          label = "Domain"
          type  = "STRING"
          value = module.cloudfront.cf_domain_name
        }
      ]
    }
  ]
}
