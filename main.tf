module "rds" {
  # https://developer.hashicorp.com/terraform/language/modules/sources#modules-in-package-sub-directories
  source = "./modules/rds"

  client_name = "Kaas_Boer 1991 bami Blok-special"
}
