terraform {
  backend "s3" {
    bucket = "juan-sicardo-terraform-up-and-running-state"
    key    = "workspaces-example/terraform.tfstate"
    region = "us-east-2"

    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
  }
}