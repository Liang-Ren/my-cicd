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
}

variable "github_repo" {
  description = "GitHub repository name (e.g. my-cicd)"
  type        = string
}

variable "github_branch" {
  description = "GitHub branch for pipeline"
  type        = string
  default     = "main"
}

variable "github_connection_arn" {
  description = "CodeStar Connections ARN for GitHub"
  type        = string
}
