terraform {
  required_providers {
    mysql = {
      source  = "petoju/mysql"
      version = ">=3.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
  required_version = ">=1.4"
}
