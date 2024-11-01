variable "endpoint" {
  type        = string
  description = "Database endpoint (host + port)"
}

variable "operating_user" {
  type        = string
  description = "The user who performs the actions"
}

variable "operating_password" {
  type        = string
  description = "Password of the user who performs the actions"
}

variable "username" {
  type        = string
  description = "Username of the new user"

  validation {
    condition     = length(var.username) < 32
    error_message = "The maximum length for user is 32 characters"
  }
}

variable "database" {
  type        = string
  description = "Database name"

  validation {
    condition     = length(var.database) < 64
    error_message = "The maximum length for database name is 64 characters"
  }
}

variable "default_character_set" {
  type        = string
  default     = "utf8mb4"
  description = "(default utf8mb4)"
}

variable "default_collation" {
  type        = string
  default     = "utf8mb4_0900_ai_ci"
  description = "(default utf8mb4_0900_ai_ci)"
}
