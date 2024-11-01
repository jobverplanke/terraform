variable "service_account_token" {
  type        = string
  description = "1Password Service Account Token"
}

variable "vault" {
  type        = string
  description = "Name of the Vault"
}

variable "client_name" {
  type        = string
  default     = ""
  description = "Name of the client (default empty string)"
}

variable "title" {
  type        = string
  description = "Title of the item"

  validation {
    condition     = var.title != ""
    error_message = "Title cannot be empty"
  }
}

variable "category" {
  type        = string
  description = "Category to place item in, options are \"login\", \"password\" or \"database\" (default password)"

  validation {
    condition     = contains(["login", "password", "database"], var.category)
    error_message = "Allowd values for \"var.category\" are \"login\", \"password\" or \"database\""
  }
}

variable "tags" {
  type        = list(string)
  default     = []
  description = "A list of tags (default client_name)"
}

variable "url" {
  type        = string
  default     = null
  description = "URL of item"
}

variable "username" {
  type        = string
  default     = null
  description = "Username"
}

variable "password" {
  type        = string
  default     = null
  description = "Password"
  sensitive   = true
}

variable "should_generate_password" {
  type        = bool
  description = "Should generate password"

  # validation {
  #   condition = var.generate_password != null
  #   error_message = "Variable \"var.generate_password\" is required"
  # }
}

variable "database_name" {
  type        = string
  default     = null
  description = "MySQL database name (default empty string)"
}

variable "database_type" {
  type        = string
  default     = "other"
  description = "MySQL database type, could be one of \"mysql\", \"postgresql\" or \"sqlite\""
}

variable "hostname" {
  type        = string
  default     = null
  description = "MySQL host (default empty string)"
}

variable "port" {
  type        = string
  default     = null
  description = "MySQL port (default empty string)"
}

variable "section" {
  type = list(object({
    section_label = string
    fields = list(object({
      label = string
      type = string
      value = string
    }))
  }))
  default = []
}
