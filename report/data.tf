data "aws_db_instance" "primary" {
  db_instance_identifier = local.rds_source
}


data "aws_db_instance" "secondary" {
  db_instance_identifier = local.rds_dest
}


# data "aws_elasticache_replication_group" "redis" {
#   replication_group_id = "tf-rep-group-1"
# }
