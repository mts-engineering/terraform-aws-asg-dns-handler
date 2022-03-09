variable "autoscale_handler_unique_identifier" {
  description = "asg_dns_handler"
}

variable "stage" {
  default = "dev"
}

variable "vpc_name" {
  description = "The name of the VPC"
}

variable "use_public_ip" {
  description = "Use public IP instead of private"
  default     = false
}

variable "autoscale_route53zone_arn" {
  description = "The ARN of route53 zone associated with autoscaling group"
}

variable "dns_iam_role_arn" {}

locals {
  aws_account_ids = {
    dev : "483211170589"
    int : "091411462528"
    stg : "877833969989"
    prod : "333618148741"
    svc : "078284402987"
  }
  stage_long = {
    dev : "development"
    int : "integration"
    stg : "staging"
    prod : "production"
  }[var.stage]
  account_id     = local.aws_account_ids[var.stage]
  svc_account_id = local.aws_account_ids["svc"]
}
