resource "aws_db_parameter_group" "default" {
  name   = "np-${local.client_name}-parameter-group"
  family = "mysql8.0"
  description = "MySQL np-${local.client_name} Parameter Group"

  parameter {
    name  = "time_zone"
    value = "Europe/Amsterdam"
  }

  parameter {
    name  = "character_set_server"
    value = var.character_set_server
  }

  parameter {
    name  = "collation-server"
    value = var.collation_server
  }

  tags = {
    application = local.client_name
    nametag = local.client_name
  }
}
