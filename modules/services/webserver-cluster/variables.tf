variable "server_to_port" {
  description = "The port where the server will be listening for HTTP requests"
  type        = number
  default     = 8080
}

variable "server_from_port" {
  description = "The server will only allow requests coming from this port"
  type        = number
  default     = 8080
}

variable "cluster_name" {
  description = "The name to use for all the cluster resources"
  type        = string
}

variable "db_remote_state_bucket" {
  description = "The name of the S3 bucket for the database's remote state"
  type        = string
}

variable "db_remote_state_key" {
  description = "The path for the database's remote state in S3"
  type        = string
}