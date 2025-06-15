variable "region" {
  default = "us-east-1"
}

variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
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

variable "ami_id" {
  description = "The ID of the Amazon Machine Image (AMI) to use for EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type to use for the application servers"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "The name of the existing EC2 Key Pair to enable SSH access to the instances"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the infrastructure will be deployed"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs where the ALB and EC2 instances will be launched"
  type        = list(string)
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "db_username" {
  description = "Username for the RDS database"
  type        = string
}

variable "db_password" {
  description = "Password for the RDS database"
  type        = string
  sensitive   = true
}

variable "alert_email" {
  description = "Email address to receive CloudWatch alerts"
  type        = string
}
