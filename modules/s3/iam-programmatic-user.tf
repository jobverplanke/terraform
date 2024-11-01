resource "random_password" "iam_password" {
  length           = 32
  special          = true
  override_special = "!#$%*()-_=+[]{}:?"
}

resource "aws_iam_user" "default" {
  name = local.iam_user

  tags = local.tags
}

resource "aws_iam_access_key" "default" {
  user = aws_iam_user.default.name
}

resource "aws_iam_user_group_membership" "default" {
  user   = aws_iam_user.default.name
  groups = local.iam_user_groups
}

resource "aws_iam_policy" "default" {
  name        = local.iam_policy_name
  description = "Access to ${local.s3_bucket_name} S3 bucket"
  policy      = data.aws_iam_policy_document.default.json
  tags        = local.tags
}

resource "aws_iam_user_policy_attachment" "default" {
  user       = aws_iam_user.default.name
  policy_arn = aws_iam_policy.default.arn
}

data "aws_iam_policy_document" "default" {
  statement {
    sid    = "AllowAdminAccessToBucketOnly"
    effect = "Allow"
    actions = [
      "s3:ListBucket",
      "s3:GetObject",
      "s3:GetObjectAcl",
      "s3:PutObject",
      "s3:PutObjectAcl",
      "s3:ReplicateObject",
      "s3:DeleteObject",
    ]

    resources = [
      aws_s3_bucket.default.arn,
      "${aws_s3_bucket.default.arn}/*"
    ]
  }
}
