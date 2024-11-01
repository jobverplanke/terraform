locals {
  service_account_token = ""
  client_name           = "Test Client Name"
  client_identifier = lower(join("", regexall("[A-Z]", local.client_name)))
  vault                 = "DevOps Tech"
}

module "rds" {
  source = "./../../modules/rds"

  client_name = local.client_name
}

# Store RDS root user in 1Password
module "one-password-ru" {
  source = "./../../modules/one-password"

  service_account_token = local.service_account_token

  client_name = local.client_name
  title       = "${local.client_name} - RDS | Admin (root)"
  category    = "database"
  vault       = local.vault
  tags        = ["rds", "aws", "database"]

  database_type = "mysql"
  hostname      = module.rds.rds_host
  port          = module.rds.rds_port
  username      = module.rds.rds_root_user
  password      = module.rds.rds_root_user_password
  should_generate_password = false
}

# Create RDS production user
module "mysql-pu" {
  source = "./../../modules/mysql"

  endpoint           = module.rds.rds_endpoint
  operating_user     = module.rds.rds_root_user
  operating_password = module.rds.rds_root_user_password

  username = "${local.client_identifier}_pu"
  database = "${local.client_identifier}_production"
}

# Create RDS acceptance user
module "mysql-au" {
  source = "./../../modules/mysql"

  endpoint           = module.rds.rds_endpoint
  operating_user     = module.rds.rds_root_user
  operating_password = module.rds.rds_root_user_password

  username = "${local.client_identifier}_au"
  database = "${local.client_identifier}_acceptance"
}

# Create RDS staging user
module "mysql-su" {
  source = "./../../modules/mysql"

  endpoint           = module.rds.rds_endpoint
  operating_user     = module.rds.rds_root_user
  operating_password = module.rds.rds_root_user_password

  username = "${local.client_identifier}_su"
  database = "${local.client_identifier}_staging"
}

# Store RDS production user in 1Password
module "one-password-pu" {
  source = "./../../modules/one-password"

  service_account_token = local.service_account_token

  client_name = local.client_name
  title       = "${local.client_name} - RDS | Production"
  category    = "database"
  vault       = local.vault
  tags        = ["rds", "database"]

  database_name = module.mysql-pu.database
  database_type = "mysql"
  hostname      = module.mysql-pu.host
  port          = module.mysql-pu.port
  username      = module.mysql-pu.user
  password      = module.mysql-pu.password
  should_generate_password = false
}

# Store RDS acceptance user in 1Password
module "one-password-au" {
  source = "./../../modules/one-password"

  service_account_token = local.service_account_token

  client_name = local.client_name
  title       = "${local.client_name} - RDS | Acceptance"
  category    = "database"
  vault       = local.vault
  tags        = ["rds", "database"]

  database_name = module.mysql-au.database
  database_type = "mysql"
  hostname      = module.mysql-au.host
  port          = module.mysql-au.port
  username      = module.mysql-au.user
  password      = module.mysql-au.password
  should_generate_password = false
}

# Store RDS staging user in 1Password
module "one-password-su" {
  source = "./../../modules/one-password"

  service_account_token = local.service_account_token

  client_name = local.client_name
  title       = "${local.client_name} - RDS | Staging"
  category    = "database"
  vault       = local.vault

  database_name = module.mysql-su.database
  database_type = "mysql"
  hostname      = module.mysql-su.host
  port          = module.mysql-su.port
  username      = module.mysql-su.user
  password      = module.mysql-su.password
  should_generate_password = false
}

# Store RDS Snapshot user in 1Password
module "one-password-rds-snapshot-user" {
  source = "./../../modules/one-password"

  service_account_token = local.service_account_token

  client_name = local.client_name
  title       = "${local.client_name} - RDS Snapshot User"
  category    = "login"
  vault       = local.vault
  tags        = ["rds", "database"]
  should_generate_password = false

  section = [
    {
      section_label = "Access Keys"
      fields = [
        {
          label = "Access Key ID"
          type  = "STRING"
          value = module.rds.iam_access_key
        },
        {
          label = "Access Key Secret"
          type  = "CONCEALED"
          value = module.rds.iam_access_key_secret
        }
      ]
    }
  ]
}
