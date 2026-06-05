/*
  modules/s3-bucket/variables.tf

  Variable definitions for the S3 bucket module.
  These variables are intentionally explicit and documented for enterprise reuse.
*/

variable "name" {
  description = "Base name for the S3 bucket. This value is combined with environment metadata to create a stable bucket name. Bucket names must be lowercase, cannot contain underscores, and must follow AWS global naming constraints."
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9-]{3,63}$", var.name))
    error_message = "The bucket name base must be 3-63 characters, lowercase letters, numbers, and hyphens only. No underscores or uppercase characters."
  }
}

variable "environment" {
  description = "Deployment environment identifier, such as prod, staging, or dev."
  type        = string
  default     = "prod"

  validation {
    condition     = can(regex("^(prod|preprod|stage|staging|dev|nonprod)$", var.environment))
    error_message = "The environment must be one of prod, preprod, stage, staging, dev, or nonprod."
  }
}

variable "tags" {
  description = "Additional tags to apply to the bucket, merged with standardized platform tags."
  type        = map(string)
  default     = {}
}

variable "versioning_enabled" {
  description = "Enable versioning for the S3 bucket."
  type        = bool
  default     = true
}

variable "force_destroy" {
  description = "Allow the bucket to be destroyed even if it contains objects. Use with caution in production."
  type        = bool
  default     = false
}
