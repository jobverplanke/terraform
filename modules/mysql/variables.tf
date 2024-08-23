variable "connect_as_user" {
  type = string
  description = "The user which performs the actions. Ensure the user has enough privileges"
}

variable "user" {
  type = string
  description = "The user that will be created. (output lower cased and spaces replaces with '_')"
}

variable "host" {
  type = string
  description = "Database hostname without schema"
}

variable "port" {
  type = number
  description = "Database port"
}

variable "database" {
  type = string
  description = "Database name"
}

variable "default_character_set" {
  type = string
  default = "utf8mb4"
  description = "(default utf8mb4)"
}

variable "default_collation" {
  type = string
  default = "utf8mb4_0900_ai_ci"
  description = "(default utf8mb4_0900_ai_ci)"
}
