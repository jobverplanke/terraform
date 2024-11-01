provider "aws" {
  region = var.region
}

locals {
  client_name                 = lower(replace(var.client_name, "/\\W|_|\\s/", "-"))
  project_name                = lower(replace(var.project_name, "/\\W|_|\\s/", "-"))
  client_name_without_spaces  = replace(var.client_name, "/\\W|_|\\s/", "")
  project_name_without_spaces = replace(var.project_name, "/\\W|_|\\s/", "")

  aws_creator = data.aws_caller_identity.current.arn

  s3_bucket_name = var.project_name != "" ? "np-${local.client_name}-${local.project_name}-${var.project_type}" : "np-${local.client_name}-${var.project_type}"

  iam_user        = var.project_name != "" ? "np-s3-${local.client_name}-${local.project_name}-${var.project_type}" : "np-s3-${local.client_name}-${var.project_type}"
  iam_policy_name = var.project_name != "" ? "AWSS3${title(local.client_name_without_spaces)}${title(local.project_name_without_spaces)}${title(var.project_type)}" : "AWSS3${title(local.client_name_without_spaces)}${title(var.project_type)}"
  iam_user_groups = compact(concat(["Projects"], var.iam_user_groups))

  tags = merge({
    application = local.client_name
    nametag     = local.client_name
    creator     = local.aws_creator
  }, var.tags)
}

data "aws_caller_identity" "current" {}
