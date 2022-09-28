module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"

  cluster_name           = "webservers-prod"
  db_remote_state_bucket = "juan-sicardo-terraform-up-and-running-tfstates"
  db_remote_state_key    = "global/s3/terraform.tfstate"

  instance_type = "m4.large"
  max_size      = 2
  min_size      = 10
}