resource "random_password" "rds_password" {
  length = 32
  special = true
  override_special = "!#$%*()-_=+[]{}:?"
}

resource "aws_db_instance" "default" {
  identifier = local.rds_instance_identifier
  engine = "mysql"
  engine_version = "8.0.35"
  instance_class = var.instance_class
  allocated_storage = var.storage
  storage_type = "gp2" # General Purpose SSD
  storage_encrypted = true
  multi_az = false
  availability_zone = var.availability_zone
  deletion_protection = var.deletion_protection
  license_model = "general-public-license"

  username = local.rds_username
  password = random_password.rds_password.result
  port = var.port
  publicly_accessible = true

  backup_retention_period = 7
  backup_window = "00:00-00:30" # UTC

  maintenance_window = "Sun:01:00-Sun:02:00" # UTC

  blue_green_update {
    enabled = true
  }

  option_group_name = "default:mysql-8-0"
  parameter_group_name = aws_db_parameter_group.default.name
  skip_final_snapshot = true

  copy_tags_to_snapshot = true

  tags = local.tags
}
