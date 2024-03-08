
# Refer to the README for information on obtaining the thumbprint.
# This is specified as a variable to allow it to be updated quickly if it is
# unexpectedly changed by CircleCI.
variable "circleci_thumbprint" {
  description = "CircleCI OpenID TLS certificate thumbprint."
  type        = string
  default     = "9e99a48a9960b14926bb7f3b02e22da2b0ab7280"
}

variable "circleci_org_uuid" {
  description = "The CircleCI organization UUID to be authorized to assume the role."
  type        = string
}

variable "circleci_project_uuids" {
  description = "List of CircleCI project UUIDs to be authorized to assume the role."
  type        = list(string)
  default     = []
}

variable "circleci_max_session_duration" {
  description = "Maximum session duration in seconds."
  type        = number
  default     = 3600

  validation {
    condition     = var.circleci_max_session_duration >= 3600 && var.circleci_max_session_duration <= 43200
    error_message = "Maximum session duration must be between 3600 and 43200 seconds."
  }
}

variable "circleci_oidc_role_attach_policies" {
  description = "List of IAM policies to attach to the CircleCI OIDC role."
  type        = list(string)
  default     = []
}

variable "circleci_role_name" {
  description = "Name of the CircleCI OIDC role."
  type        = string
  default     = "circleci-oidc-provider-aws"
}

variable "circleci_role_description" {
  description = "(Optional) Description of the role."
  type        = string
  default     = "Role assumed by the CircleCI OIDC provider."
}

variable "tags" {
  description = "A mapping of tags to assign to all resources created by this module."
  type        = map(string)
  default     = {}
}