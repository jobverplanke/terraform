variable "client_name" {
  type = string
  default = ""
  description = "Name of the client (default empty string)"
}

variable "service_account_token" {
  type = string
  description = "1Password Service Account Token"
}

variable "vault" {
  type = string
  description = "Name of the Vault"
}

variable "title" {
  type = string
  description = "Title of the item"
}

variable "category" {
  type = string
  description = "Category to place item in, options are login, password, or database (default password)"
}

variable "tags" {
  type = list(string)
  default = []
  description = "A list of tags (default client_name)"
}

variable "url" {
  type = string
  default = ""
  description = "URL of item"
}

variable "username" {
  type = string
  description = "MySQL user"
}

variable "password" {
  type = string
  description = "MySQL user password"
  sensitive = true
}

variable "database_name" {
  type = string
  description = "MySQL database name"
}

variable "database_type" {
  type = string
  default = "mysql"
  description = "MySQL database typ, could be one of 'mssql', 'mysql', 'postgresql', 'sqlite', or 'other' (default mysql)"
}

variable "hostname" {
  type = string
  default = ""
  description = "MySQL host (default empty string)"
}

variable "port" {
  type = number
  default = 3306
  description = "MySQL port (default 3306)"
}
