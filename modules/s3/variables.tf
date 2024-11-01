variable "region" {
  type        = string
  default     = "eu-west-1"
  description = "(default eu-west-1)"
}

variable "client_name" {
  type        = string
  description = "Name of the client"

  validation {
    condition     = var.client_name != ""
    error_message = "\"var.client_name\" cannot be empty"
  }
}

variable "project_name" {
  type        = string
  default     = ""
  description = "Name of the project belonging to client (default empty string)"
}

variable "project_type" {
  type        = string
  description = "What type of project is it? Allowed values are \"web\" or \"api\""

  validation {
    condition     = contains(["web", "api"], var.project_type)
    error_message = "Allowd values for \"var.project_type\" are \"web\" or \"api\""
  }
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A mapping of tags to assign to various services"
}
