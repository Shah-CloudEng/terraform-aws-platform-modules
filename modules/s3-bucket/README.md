# s3-bucket module

## Overview

The `s3-bucket` module provides an enterprise-ready scaffold for AWS S3 bucket management. It is intended to support standardized naming, tagging, and lifecycle controls for platform and application workloads.

> Note: This module is currently scaffolded and does not yet provision AWS resources. The implementation is structured for future production-grade resource definitions.

## Status

- Scaffold created
- Core variables and outputs defined
- Naming and tags constructed via local values
- Implementation placeholders included for future AWS resource creation

## Usage

```hcl
module "platform_s3_bucket" {
  source      = "../modules/s3-bucket"
  name        = "platform-app"
  environment = "prod"
  tags = {
    Project = "Platform"
    Owner   = "Platform Engineering"
  }
}
```

## Inputs

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `name` | `string` | n/a | Base name for the S3 bucket. Combined with environment metadata to derive the full bucket name. Must be lowercase, cannot contain underscores, and should comply with AWS global S3 bucket naming rules. |
| `environment` | `string` | `"prod"` | Deployment environment identifier. |
| `tags` | `map(string)` | `{}` | Additional tags to apply to the bucket. |
| `versioning_enabled` | `bool` | `true` | Enable versioning for the bucket. |
| `force_destroy` | `bool` | `false` | Allow bucket destruction even if objects exist. Use carefully. |

## Outputs

| Name | Description |
|------|-------------|
| `bucket_name` | Derived bucket name based on provided inputs. |
| `bucket_arn` | Constructed S3 bucket ARN. |
| `bucket_tags` | Merged set of tags that will be applied to the bucket. |

## Development notes

- Add AWS resource definitions in `main.tf` once the module contract is finalized.
- Implement encryption, public access block, lifecycle rules, and logging policies.
- Keep the module small, reusable, and compatible with enterprise platform guardrails.
