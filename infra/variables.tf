variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name prefix"
  type        = string
  default     = "my-cicd"
}

variable "github_owner" {
  description = "GitHub owner (e.g. Liang-Ren)"
  type        = string
  default     = "Liang-Ren"
}

variable "github_repo" {
  description = "GitHub repository name (e.g. my-cicd)"
  type        = string
  default     = "my-cicd"
}

variable "github_branch" {
  description = "GitHub branch for pipeline"
  type        = string
  default     = "main"
}

variable "github_connection_arn" {
  description = "CodeStar Connections ARN for GitHub"
  type        = string
  default     = "arn:aws:codeconnections:us-east-1:895169747731:connection/a806753a-005a-464c-b1c6-f99bc1d5a191"
}
