# Contributing to terraform-aws-platform-modules

## Branching strategy

- `main` contains the current stable and release-ready code.
- Create feature branches from `main` using a descriptive prefix, for example:
  - `feature/s3-bucket-scaffold`
  - `fix/variable-validation`
  - `chore/docs-update`
- Keep feature branches focused and small to ease review.
- Rebase or merge the latest `main` before opening a pull request.

## Pull request process

- Open a pull request against `main` with a clear title and description.
- Reference any related issue or design discussion.
- Include testing notes for Terraform formatting and validation.
- Ensure PRs are reviewed by at least one other engineer.
- Address review comments before merging.
- Do not merge your own PR without an independent review unless explicitly approved by the team.

## Code reviews

- Verify that module inputs and outputs are documented.
- Confirm naming conventions, tagging, and environment isolation approaches.
- Check for hard-coded values or missing security controls.
- Validate that changes are consistent with repository standards and existing modules.

## Terraform formatting requirements

- Run `terraform fmt -recursive` before pushing changes.
- Run `terraform validate` in the module root or example workspace when applicable.
- Keep HCL style consistent: clear variable naming, description usage, and logical block grouping.

## Module standards

- Modules should be reusable and parameterized by environment, tags, and naming.
- Document all required and optional variables in the module README.
- Avoid embedding environment-specific data in the module implementation.
- Use explicit `type` declarations and validation rules for variables.
- Provide outputs for resource identifiers and integration points.
- Keep modules small and cohesive, with one primary domain responsibility.
