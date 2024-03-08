# AWS CircelCI OIDC Provider Terraform Module

This module allows you to create a CircelCI OIDC provider and the associated IAM roles, that will help CircleCI to securely authenticate against the AWS API using an IAM role.

---

## Documentation

- [TFLint Rules](https://github.com/terraform-linters/tflint/tree/master/docs/rules)

## Usage example

IMPORTANT: The master branch is used in source just as an example. In your code, do not pin to master because there may be breaking changes between releases. Instead pin to the release tag (e.g. ?ref=tags/x.y.z) of one of our [latest releases](https://github.com/jaconi-io/terraform-aws-circleci-oidc-provider/releases).

```hcl
module "circleci-oidc" {
  source = "TBD"
  version = "TBD"

  create_oidc_provider = true
  create_oidc_role     = true

  circleci_org_uuid = "1a1a1a1a-2b2b-3c3c-4d4d-5e5e5e5e5e5e"
  circleci_project_uuids = [
    "aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee",
    "11111111-2222-3333-4444-555555555555"
  ]
  
  circleci_oidc_role_attach_policies = [
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  ]
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
# AWS CircelCI OIDC Provider Terraform Module

## Purpose
This module allows you to create a CircleCI OIDC provider for your AWS account, that will help CircleCI to securely authenticate against the AWS API using an IAM role

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.20 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.20 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_openid_connect_provider.circleci](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_role.circleci](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.circleci](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_circleci_max_session_duration"></a> [circleci\_max\_session\_duration](#input\_circleci\_max\_session\_duration) | Maximum session duration in seconds. | `number` | `3600` | no |
| <a name="input_circleci_oidc_role_attach_policies"></a> [circleci\_oidc\_role\_attach\_policies](#input\_circleci\_oidc\_role\_attach\_policies) | List of IAM policies to attach to the CircleCI OIDC role. | `list(string)` | `[]` | no |
| <a name="input_circleci_org_uuid"></a> [circleci\_org\_uuid](#input\_circleci\_org\_uuid) | The CircleCI organization UUID to be authorized to assume the role. | `string` | n/a | yes |
| <a name="input_circleci_project_uuids"></a> [circleci\_project\_uuids](#input\_circleci\_project\_uuids) | List of CircleCI project UUIDs to be authorized to assume the role. | `list(string)` | `[]` | no |
| <a name="input_circleci_role_description"></a> [circleci\_role\_description](#input\_circleci\_role\_description) | (Optional) Description of the role. | `string` | `"Role assumed by the CircleCI OIDC provider."` | no |
| <a name="input_circleci_role_name"></a> [circleci\_role\_name](#input\_circleci\_role\_name) | Name of the CircleCI OIDC role. | `string` | `"circleci-oidc-provider-aws"` | no |
| <a name="input_circleci_thumbprint"></a> [circleci\_thumbprint](#input\_circleci\_thumbprint) | CircleCI OpenID TLS certificate thumbprint. | `string` | `"9e99a48a9960b14926bb7f3b02e22da2b0ab7280"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to all resources created by this module. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_oidc_provider_arn"></a> [oidc\_provider\_arn](#output\_oidc\_provider\_arn) | OIDC provider ARN |
| <a name="output_oidc_role"></a> [oidc\_role](#output\_oidc\_role) | CICD GitHub role. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


### :memo: Guidelines

 - :memo: Use a succinct title and description.
 - :bug: Bugs & feature requests can be be opened
 - :signal_strength: Support questions are better asked on [Stack Overflow](https://stackoverflow.com/)
 - :blush: Be nice, civil and polite ([as always](http://contributor-covenant.org/version/1/4/)).

## License

Copyright 2024 jaconi GmbH

MIT Licensed. See [LICENSE](./LICENSE) for full details.

## How to Contribute

Submit a pull request

# Authors

Currently maintained by [jaconi-io](https://github.com/jaconi-io).

[![ForTheBadge uses-git](http://ForTheBadge.com/images/badges/uses-git.svg)](https://GitHub.com/)

## Terraform Registry

TODO

## Resources

TODO

## Acknowledgements

This module was heavily inspired by the [terraform-aws-github-oidc-provider](https://github.com/terraform-module/terraform-aws-github-oidc-provider/tree/master) module.