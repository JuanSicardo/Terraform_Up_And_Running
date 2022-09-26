module "webserver_cluster" {
  source                 = "../../../modules/services/webserver-cluster"

  cluster_name           = "webservers-stage"
  db_remote_state_bucket = "juan-sicardo-terraform-up-and-running-tfstates"
  db_remote_state_key    = "global/s3/terraform.tfstate"
}