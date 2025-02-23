variable "region" {
  description = "AWS region to create the S3 bucket"
  type        = string
}

variable "aws_account_id" {
  description = "AWS account ID."
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "project" {
  description = "Project name to tag resources"
  type        = string
  default     = "karpenter"
}