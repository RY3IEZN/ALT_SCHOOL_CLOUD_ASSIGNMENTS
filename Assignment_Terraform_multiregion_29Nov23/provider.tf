# ---root/provider.tf---


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
  region = "eu-west-1"
}

provider "aws" {
  alias  = "frankfurt"
  region = "eu-central-1"
}
provider "aws" {
  alias  = "london"
  region = "eu-west-2"
}
