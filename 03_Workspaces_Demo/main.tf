resource "aws_instance" "example" {
  ami = "ami-02f3416038bdb17fb"
  instance_type = "t2.micro"
}