terraform {
  backend "s3" {
    bucket = "juan-sicardo-terraform-up-and-running-tfstates"
    key    = "stage/data-stores/mysql/terraform.tfstate"
    region = "us-east-2"

    dynamodb_table = "juan-sicardo-terraform-up-and-running-locks"
    encrypt        = true
  }
}