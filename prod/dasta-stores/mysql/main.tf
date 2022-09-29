module "mysql_db" {
  source = "../../../modules/data-stores/mysql"

  db_name = "mysqlprod"
}