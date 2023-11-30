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
  access_key = "AKIAXQSK72JAFBAY6LEH"
  secret_key = "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"
}

provider "aws" {
  alias      = "london"
  region     = "eu-west-2"
  access_key = "AKIAXQSK72JAFBAY6LEH"
  secret_key = "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"
}
