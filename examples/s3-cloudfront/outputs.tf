output "cf_domain_name" {
  value       = module.cloudfront.cf_domain_name
  description = "Domain name corresponding to the distribution. For example: d604721fxaaqy9.cloudfront.net"
}

output "acm_domain_name" {
  value       = module.cloudfront.acm_domain_name
  description = "Domain name for which the certificate is issued"
}

output "cf_domain_validation_options_domain_name" {
  value       = module.cloudfront.cf_domain_validation_options_domain_name
  description = "Domain to be validated"
}

output "cf_domain_validation_options_resource_record_name" {
  value       = module.cloudfront.cf_domain_validation_options_resource_record_name
  description = "The name of the DNS record to create to validate the certificate"
}

output "cf_domain_validation_options_resource_record_type" {
  value       = module.cloudfront.cf_domain_validation_options_resource_record_type
  description = "The type of DNS record to create"
}

output "cf_domain_validation_options_resource_record_value" {
  value       = module.cloudfront.cf_domain_validation_options_resource_record_value
  description = "The value the DNS record needs to have"
}
