variable "project_id" {
  description = "project id"
}

variable "region" {
  description = "region"
}

variable "gke_username" {
  default     = ""
  description = "gke username"
}

variable "gke_password" {
  # default     = "Should123Work"
  type        = string
  description = "gke password"
  validation {
    condition     = length(var.gke_password) >= 8 && can(regex(".*[A-Z].*", var.gke_password))
    error_message = "The gke_password must be 8 or more characters and have one (or more) capitals."
  }
}

variable "gke_num_nodes" {
  default     = 2
  description = "number of gke nodes"
}
