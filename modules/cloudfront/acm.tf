# Request certificate for custom domain
resource "aws_acm_certificate" "default" {
  provider          = aws.us-east
  domain_name       = local.cf_cdn_domain
  validation_method = "DNS"
}

# Validate certificate
resource "aws_acm_certificate_validation" "default" {
  provider                = aws.us-east
  certificate_arn         = aws_acm_certificate.default.arn
  validation_record_fqdns = [local.cf_cdn_domain]
}
