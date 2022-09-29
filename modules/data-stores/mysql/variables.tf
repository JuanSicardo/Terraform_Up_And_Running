variable "db_username" {
  description = "The username for the database"
  type        = string
  sensitive   = true
  default     = "jsicardo"
}

variable "db_password" {
  description = "The password for the database"
  type        = string
  sensitive   = true
  default     = "jsicardo"
}

variable "db_name" {
  description = "Name for the database"
  type = string
}