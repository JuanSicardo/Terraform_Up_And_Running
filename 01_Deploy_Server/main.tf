provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "example" {
  # Ubuntu 22.04 x86
  ami           = "ami-02f3416038bdb17fb"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-example"
  }
}