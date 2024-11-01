resource "aws_db_parameter_group" "default" {
  name        = local.db_parameter_group_name
  family      = "mysql8.0"
  description = "Parameter Group for ${local.rds_instance_identifier} RDS instance"

  parameter {
    name  = "time_zone"
    value = "Europe/Amsterdam"
  }

  parameter {
    name  = "character_set_server"
    value = var.character_set_server
  }

  parameter {
    name  = "collation_server"
    value = var.collation_server
  }

  tags = local.tags
}
