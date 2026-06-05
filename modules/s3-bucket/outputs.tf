/*
  modules/s3-bucket/outputs.tf

  Output values for the S3 bucket module scaffolding.
*/

output "bucket_name" {
  description = "Derived bucket name for the S3 bucket module."
  value       = local.bucket_name
}

output "bucket_arn" {
  description = "Constructed ARN for the S3 bucket."
  value       = format("arn:aws:s3:::%s", local.bucket_name)
}

output "bucket_tags" {
  description = "Merged tag set that will be applied to the S3 bucket."
  value       = local.bucket_tags
}
