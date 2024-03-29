output "oidc_provider_arn" {
  description = "OIDC provider ARN"
  value       = try(aws_iam_openid_connect_provider.circleci.arn, "")
}

output "oidc_role" {
  description = "CICD GitHub role."
  value       = try(aws_iam_role.circleci.arn, "")
}