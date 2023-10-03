locals {
  # primary
  source_host                 = data.aws_db_instance.primary.address
  source_username             = "postgres"
  source_password             = "CuTGUoIA"
  source_database             = "postgres"
  source_redis_topic_prefix   = "cdc-source"
  source_debezium_publication = "dbz_publication"
  source_port                 = 5432
  # secondary
  dest_host                 = data.aws_db_instance.secondary.address
  dest_username             = "postgres"
  dest_password             = "CuTGUoIA"
  dest_database             = "postgres"
  dest_redis_topic_prefix   = "cdc-dest"
  dest_debezium_publication = "dbz_publication"
  dest_port                 = 5432
  dest_subscription_name    = "my_subscription"
  sql_file_path             = "/config/demo.sql"

  # redis

  redis_host     = "sample.com"
  redis_port     = 6379
  redis_password = ""

  #config
  app_image  = "rweebs/cdc:1.0.4"
  app_config = "report-config"
  app_label  = "cdc-report"

  rds_source = "rds-source"
  rds_dest   = "rds-native"
}
