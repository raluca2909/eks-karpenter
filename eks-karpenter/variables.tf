variable "region" {
  description = "The primary AWS region to deploy resources."
  type        = string
}

variable "aws_account_id" {
  description = "The AWS account ID."
  type        = string
}

variable "virginia_region" {
  description = "The region for the aliased AWS provider."
  type        = string
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
}

variable "state_bucket" {
  description = "S3 bucket name for Terraform state."
  type        = string
}

variable "state_region" {
  description = "AWS region for the Terraform state bucket."
  type        = string
}

variable "state_key" {
  description = "Key for the Terraform state file in the S3 bucket."
  type        = string
}