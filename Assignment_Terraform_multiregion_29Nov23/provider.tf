# ---root/provider.tf


# configure the provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region     = "eu-west-1"
  access_key = ""
  secret_key = ""
}

provider "aws" {
  alias      = "frankfurt"
  region     = "eu-central-1"
  access_key = ""
  secret_key = ""
}
provider "aws" {
  alias      = "london"
  region     = "eu-west-2"
  access_key = ""
  secret_key = ""
}