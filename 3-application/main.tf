
provider "aws" {
  version = ">= 0.12.8"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = var.region
  profile = var.profile
}

terraform {
  backend "s3" {
    bucket = "rm-terraform-backend"
    key    = "prod/application.tfstates"
    region = "eu-west-1"
    profile = "default"
  }
}

data "terraform_remote_state" "platform" {
  backend = "s3"

  config = {
    key    = var.remote_state_key
    bucket = var.remote_state_bucket
    region = var.region
  }
}
