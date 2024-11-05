module "one-password" {
  source = "../../modules/one-password"

  service_account_token = var.service_account_token

  vault = "DevOps Tech"

  title                    = "Test MySQL User"
  category                 = "login"
  should_generate_password = true

  # database_name = "database name"
  # database_type = "mysql"
  # hostname = "some hostname"
  # port = "3306"
  # url = "some url"

  section = [
    {
      section_label = "Access Keys"
      fields = [
        {
          label = "Access Key"
          type  = "STRING"
          value = "SomeAccessKey"
        },
        {
          label = "Access Key Secret"
          type  = "CONCEALED"
          value = "SomeAccessKeySecret"
        }
      ]
    },
    {
      section_label = "More random things"
      fields = [
        {
          label = "AA random label"
          type  = "STRING"
          value = "RandomValue"
        },
      ]
    }
  ]
}
