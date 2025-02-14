variable "vpc" {
  description = "vpc configurables"
  type = object({
    aws_availability_zones = any
    aws_subnets_private = list(any)
    aws_subnets_public = list(any)
    aws_vpc = any
    aws_nat_gateway = list(any)
  })
}

variable "key_bucket_name" {
  description = "bucket name where concourse keys are stored"
  type = string
}

locals {
  zone_names = var.vpc.aws_availability_zones.names
}

variable "tags" {
  description = "tags to apply to aws resource"
  type = map(string)
}

variable "cluster_name" {
  description = "cluster name, used in dns"
  type        = string
  default     = "concourse"
}

variable "concourse_version" {
  description = "concourse version to install"
  type        = string
  default     = "5.2.0"
}

variable "parent_domain_name" {
  description = "parent domain name for CI"
  type        = string
}

variable "whitelist_cidr_blocks" {
  description = "list of allowed cidr blocks"
  type = list(string)
}

variable "secrets" {
  description = "ssm secret names"
  type = object({
    database = object({
      user_ssm_name = string
      password_ssm_name = string
    })
    admin = object({
      user_ssm_name = string
      password_ssm_name = string
    })
  })
}

variable "database" {
  description = "database configuration options"
  type = object({
    name = string
    instance_type = string
    count         = number
  })
  default = {
    name          = "concourse"
    instance_type = "db.r5.large"
    count         = 2
  }
}

variable "web" {
  description = "atc/tsa configuration options"
  type = object({
    count          = number
    instance_type  = string
    environment_override = map(string)
  })
  default = {
    instance_type = "t3.micro"
    count         = 2
    environment_override = {}
  }
}

variable "worker" {
  description = "worker configuration options"
  type = object({
    instance_type = string
    count         = number
    environment_override = map(string)
  })
  default = {
    instance_type = "t3.micro"
    count         = 2
    environment_override = {}
  }
}
