locals {
  region = "us-west-2"
}

module "bucardo" {
  source  = "terraform-aws-modules/rds/aws"
  version = "6.1.0"

  identifier = "rds-bucardo"

  engine            = "postgres"
  engine_version    = "14.7"
  instance_class    = "db.t3.micro"
  allocated_storage = 5

  username = "postgres"
  password = "CuTGUoIA"

  vpc_security_group_ids = [module.security_groups.security_group_id]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  # Enhanced Monitoring - see example for details on how to create the role
  # by yourself, in case you don't want to create it automatically
  monitoring_interval    = "30"
  monitoring_role_name   = "RDSMonitoringRole"
  create_monitoring_role = true
  publicly_accessible    = true
  apply_immediately      = true

  # DB subnet group
  create_db_subnet_group = true
  subnet_ids             = data.aws_subnets.db.ids

  # DB parameter group
  family = "postgres14"

  # DB option group
  major_engine_version = "14.7"

  iam_database_authentication_enabled = false
  manage_master_user_password         = false

  parameters = [
    {
      name         = "rds.logical_replication"
      value        = 1
      apply_method = "pending-reboot"
    }
  ]
}

module "native" {
  source  = "terraform-aws-modules/rds/aws"
  version = "6.1.0"

  identifier = "rds-native"

  engine            = "postgres"
  engine_version    = "14.7"
  instance_class    = "db.t3.micro"
  allocated_storage = 5

  username = "postgres"
  password = "CuTGUoIA"

  vpc_security_group_ids = [module.security_groups.security_group_id]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  # Enhanced Monitoring - see example for details on how to create the role
  # by yourself, in case you don't want to create it automatically
  monitoring_interval    = "30"
  monitoring_role_name   = "RDSMonitoringRole1"
  create_monitoring_role = true
  publicly_accessible    = true
  apply_immediately      = true

  # DB subnet group
  create_db_subnet_group = true
  subnet_ids             = data.aws_subnets.db.ids

  # DB parameter group
  family = "postgres14"

  # DB option group
  major_engine_version = "14.7"

  iam_database_authentication_enabled = false
  manage_master_user_password         = false

  parameters = [
    {
      name         = "rds.logical_replication"
      value        = 1
      apply_method = "pending-reboot"
    }
  ]
}

module "source" {
  source  = "terraform-aws-modules/rds/aws"
  version = "6.1.0"

  identifier = "rds-source"

  engine            = "postgres"
  engine_version    = "12.15"
  instance_class    = "db.t3.micro"
  allocated_storage = 5

  username = "postgres"
  password = "CuTGUoIA"

  vpc_security_group_ids = [module.security_groups.security_group_id]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  # Enhanced Monitoring - see example for details on how to create the role
  # by yourself, in case you don't want to create it automatically
  monitoring_interval    = "30"
  monitoring_role_name   = "RDSMonitoringRole3"
  create_monitoring_role = true
  publicly_accessible    = true
  apply_immediately      = true

  # DB subnet group
  create_db_subnet_group = true
  subnet_ids             = data.aws_subnets.db.ids

  # DB parameter group
  family = "postgres12"

  # DB option group
  major_engine_version = "12.15"

  iam_database_authentication_enabled = false
  manage_master_user_password         = false

  parameters = [
    {
      name         = "rds.logical_replication"
      value        = 1
      apply_method = "pending-reboot"
    }
  ]
}
