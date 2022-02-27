variable "gcp_project_id" {
  description = "define on the environment"
  type        = string
}

variable "gcp_region" {
  description = "define on the environment"
  type        = string
}

variable "gcp_zone" {
  description = "define on the environment"
  type        = list(string)
}
