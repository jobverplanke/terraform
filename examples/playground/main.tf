locals {
  client_name = "Test Client Name"
  client_id   = lower(join("", regexall("[A-Z]", local.client_name))) # should output: TCN
}

output "client_id" {
  value = local.client_id
}
