provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = var.region
}

terraform {
  backend "local" {
    path = "terraform-state-files"
  }
}

resource "aws_s3_bucket" "rm-terraform-backend" {
    bucket = "rm-terraform-backend"
    versioning {
      enabled = true
    }
    lifecycle {
      prevent_destroy = false
    }

}

