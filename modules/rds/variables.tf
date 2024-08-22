variable "region" {
  type = string
  default = "eu-west-1"
  description = "(default eu-west-1)"
}

variable "client_name" {
  type = string
  description = "Name of the client"
}

variable "port" {
  type = number
  default = 3306
  description = "RDS instance port number (default 3306)"
}

variable "instance_class" {
  type = string
  default = "db.t3.micro"
  description = "Choose between db.t3.micro, db.t3.small, db.t3.medium or db.t3.large (default db.t3.micro)"
}

variable "storage" {
  type = number
  default = 20
  description = "The minimum value is 20 GB and the maximum value is 6000 GB (default 20 GB)"
}

variable "character_set_server" {
  type = string
  default = "utf8mb4"
  description = "(default utf8mb4)"
}

variable "collation_server" {
  type = string
  default = "utf8mb4_0900_ai_ci"
  description = "(default utf8mb4_0900_ai_ci)"
}

variable "availability_zone" {
  type = string
  default = "eu-west-1a"
  description = "Choose between eu-west-1a, eu-west-1b or eu-west-1c (default eu-west-1a)"
}

variable "tags" {
  type = map(string)
  default = {}
  description = "A mapping of tags to assign to the RDS instance"
}
