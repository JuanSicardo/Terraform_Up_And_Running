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