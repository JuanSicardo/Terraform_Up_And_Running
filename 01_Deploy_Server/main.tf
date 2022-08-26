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