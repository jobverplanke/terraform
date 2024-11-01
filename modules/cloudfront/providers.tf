terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = var.region
}

# ACM Certificates can only be requested in "us-east-1" region
provider "aws" {
  profile = "default"
  alias   = "us-east"
  region  = "us-east-1"
}
