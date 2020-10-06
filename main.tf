terraform {
  required_version = "~> 0.13.4"
}

provider "aws" {
  region  = var.region
  version = "~> 3.0"
  profile = "default"
}