resource "aws_db_subnet_group" "Hilton-rds-db-sub" {
  name       = var.db_sg_name
  subnet_ids = var.db_subnet_ids
}