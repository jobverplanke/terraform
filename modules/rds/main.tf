provider "aws" {
  region = var.region
}

locals {
  client_name = lower(replace(var.client_name, "/\\W|_|\\s/", "-"))

  aws_account_id = data.aws_caller_identity.current.account_id
  aws_creator    = data.aws_caller_identity.current.arn

  rds_instance_identifier = "np-${local.client_name}"
  rds_username            = lower(replace(var.client_name, "/\\W|_|\\s/", "_"))

  iam_user        = "np-rds-snapshot-${local.client_name}"
  iam_user_groups = ["Projects"]
  iam_policy_name = "AWSRDSSnapshot${title(replace(var.client_name, "/\\W|_|\\s/", ""))}"

  db_parameter_group_name = "np-${local.client_name}-parameter-group"

  tags = merge({
    application = local.client_name
    nametag     = local.client_name
    creator     = local.aws_creator
  }, var.tags)
}

data "aws_caller_identity" "current" {}
