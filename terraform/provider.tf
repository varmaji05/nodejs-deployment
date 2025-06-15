terraform {
  required_version = ">= 1.1.0"

  backend "remote" {
    organization = "vinod0510"

    workspaces {
      name = "nodejs-deployment"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}
