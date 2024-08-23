locals {
  aws_account_id = data.aws_caller_identity.current.account_id
  aws_account_name = data.aws_caller_identity.current.arn
}

data "aws_caller_identity" "current" {}

output "caller_arn" {
  value = local.aws_account_name
}

output "caller_account_id" {
  value = local.aws_account_id
}
