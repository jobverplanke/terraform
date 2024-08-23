resource "random_password" "iam_password" {
  length = 32
  special = true
  override_special = "!#$%*()-_=+[]{}:?"
}

resource "aws_iam_user" "default" {
  name = "np-rds-snapshot-${local.iam_user}"

  tags = local.tags
}

resource "aws_iam_access_key" "default" {
  user = aws_iam_user.default.name
}

resource "aws_iam_user_group_membership" "default" {
  user = aws_iam_user.default.name
  groups = ["Projects"]
}

resource "aws_iam_policy" "default" {
  name = local.iam_policy_name
  description = "Create and manage RDS Snapshots for RDS instance ${local.rds_instance_identifier}"
  policy = data.aws_iam_policy_document.default.json
  tags = local.tags
}

resource "aws_iam_user_policy_attachment" "default" {
  user       = aws_iam_user.default.name
  policy_arn = aws_iam_policy.default.arn
}

data "aws_iam_policy_document" "default" {
  statement {
    sid = "CreateAndManageRDSSnapshots"
    effect = "Allow"
    actions = [
      "rds:AddTagsToResource",
      "rds:DescribeDBSnapshots",
      "rds:CreateDBSnapshot",
      "rds:DeleteDBSnapshot"
    ]
    resources = [
      "arn:aws:rds:*:${local.aws_account_id}:snapshot:*",
      aws_db_instance.default.arn,
    ]
  }
}
