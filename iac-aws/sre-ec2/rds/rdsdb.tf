module "rdsdb" {
  source                                = "terraform-aws-modules/rds/aws"
  version                               = "8.7.0"
  #
  identifier                            = "local.name"
  #
  engine                                = "postgres"
  engine_version                        = "0.0.xxx"
  family                                = "postgres.family"
  major_engine_version                  = ""
  instance_class                        = ""
  #
  allocated_storage                     = 20
  max_allocated_storage                 = 100
  storage_encrypted                     = false
  #
  name                                  = "postgres-dbInstance"
  username                              = "username"
  password                              = "password"
  port                                  = 5432
  #
  multi_az                              = true
  subnet_ids                            = "vpc.database_subnets"
  vpc_security_group_ids                = "vpc.security_group.ids"
  #
  maintenance_windows                   = "Mon:00:00"
  backup_window                         = "03:00"
  enabled_cloudwatch_logs_exports       = ["general"]
  #
  backup_retention_period               = 0
  skip_final_snapshot                   = true
  deletion_protection                   = false
  #
  performance_insights_enabled          = true
  performance_insights_retention_period = 7
  create_monitoring_role                = true
  monitoring_interval                   = 60
  #
  parameters                            = [
    {
      // postgres
      name  = "char"
      value = "utf"
    }
  ]
  #
  tags             = "local.common_tags"
  #
  db_instance_tags = {
    "Sensitive" = "high"
  }
  db_option_group_tags = {
    "Sensitive" = "low"
  }
  db_parameter_group_tags = {
    "Sensitive" = "low"
  }
  db_subnet_group_tags = {
    "Sensitive" = "high"
  }
}