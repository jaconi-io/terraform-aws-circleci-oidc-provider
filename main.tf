/**
 * # AWS CircelCI OIDC Provider Terraform Module
 *
 * ## Purpose
 * This module allows you to create a CircleCI OIDC provider for your AWS account, that will help CircleCI to securely authenticate against the AWS API using an IAM role
 *
*/
resource "aws_iam_openid_connect_provider" "circleci" {
  client_id_list = [
    var.circleci_org_uuid,
  ]

  thumbprint_list = [var.circleci_thumbprint]
  url             = "https://oidc.circleci.com/org/${var.circleci_org_uuid}"
}

resource "aws_iam_role" "circleci" {
  name                 = var.circleci_role_name
  description          = var.circleci_role_description
  max_session_duration = var.circleci_max_session_duration
  assume_role_policy   = join("", data.aws_iam_policy_document.circleci[*].json)
  tags                 = var.tags
  # path                  = var.iam_role_path
  # permissions_boundary  = var.iam_role_permissions_boundary
  depends_on = [aws_iam_openid_connect_provider.circleci]
}

resource "aws_iam_role_policy_attachment" "attach" {
  for_each = toset(var.circleci_oidc_role_attach_policies)

  policy_arn = each.key
  role       = join("", aws_iam_role.circleci[*].name)

  depends_on = [aws_iam_role.circleci]
}

data "aws_iam_policy_document" "circleci" {

  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    condition {
      test = "StringLike"
      values = [
        for project in var.circleci_project_uuids :
        "org/${var.circleci_org_uuid}/project/${project}/user/*"
      ]
      variable = "oidc.circleci.com/org/${var.circleci_org_uuid}:sub"
    }

    principals {
      identifiers = [aws_iam_openid_connect_provider.circleci.arn]
      type        = "Federated"
    }
  }
}
