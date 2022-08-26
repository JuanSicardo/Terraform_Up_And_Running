provider "aws" {
  region = "us-east-2"
}

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

output "server_public_ip" {
  value       = aws_instance.example.public_ip
  description = "The public IP address of the web server"
}

resource "aws_instance" "example" {
  # Ubuntu 22.04 x86
  ami                    = "ami-02f3416038bdb17fb"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]

  # Create a simple web server
  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p ${var.server_to_port} &
              EOF

  user_data_replace_on_change = true

  tags = {
    Name = "terraform-example"
  }
}

resource "aws_security_group" "instance" {
  name = "terraform-example-instance"

  ingress {
    from_port   = var.server_from_port
    to_port     = var.server_to_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}