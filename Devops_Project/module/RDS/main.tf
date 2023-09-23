resource "aws_db_instance" "Hilton-rds" {
  allocated_storage      = 10
  db_name                = var.m_db_name
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t3.micro"
  username               = var.m_username
  password               = var.m_password
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = true
  publicly_accessible    = false
  db_subnet_group_name   = var.m_db_subnet_group_name
  vpc_security_group_ids = var.m_vpc_security_group_ids
}