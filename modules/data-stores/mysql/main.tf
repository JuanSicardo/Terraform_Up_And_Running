resource "aws_db_instance" "web_server_db" {
  identifier_prefix   = "${var.db_name}-sql-db"
  engine              = "mysql"
  allocated_storage   = 10
  instance_class      = "db.t2.micro"
  skip_final_snapshot = true
  db_name             = "${var.db_name}-sql-db"

  # How should we set the username and password?
  username = var.db_username
  password = var.db_password
}