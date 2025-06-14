variable "aws_region" {
  default = "us-east-1"
}

variable "project" {
  default = "demo"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnets" {
  type = map(object({
    cidr = string
    az   = string
  }))
  default = {
    "pub-1" = { cidr = "10.0.1.0/24", az = "us-east-1a" },
    "pub-2" = { cidr = "10.0.2.0/24", az = "us-east-1b" }
  }
}

variable "private_subnets" {
  type = map(object({
    cidr = string
    az   = string
  }))
  default = {
    "priv-1" = { cidr = "10.0.11.0/24", az = "us-east-1a" },
    "priv-2" = { cidr = "10.0.12.0/24", az = "us-east-1b" }
  }
}

variable "project" {
  description = "Project name prefix"
  default     = "demo"
}
