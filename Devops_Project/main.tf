
module "vpc" {
  source              = "./module/VPC"
  vpc_cidr          = var.L_vpc_cidr
  availability_zone = var.L_availability_zone
  pvt_cidr          = var.L_pvt_cidr
  pub_cidr          = var.L_pub_cidr
  destination_cidr  = var.L_destination_cidr

}

// this is for web 
module "web_ssh_key_pair" {
  source            = "./module/Ssh-key"
  keyname         = var.L_web_keyname
  public_key_path = var.L_web_public_key_path
}

module "web_security_group" {
  source     = "./module/Security_Group"
  sg_name  = var.L_web_sg_name
  Sg_ports = var.L_web_sg_ports
  //proto    = var.L_web_proto
  Cidr_blocks   = var.L_web_cidrs
  vpc_id   = module.vpc.my_vpc_id
}

module "web_ec2_instance" {
  source               = "./module/Ec2-instance"
  ami_id             = var.L_web_ami_id
  instance_type      = var.L_web_instance_type
  key_name           = module.web_ssh_key_pair.ssh_key_pair_key_name
  security_group_ids = [module.web_security_group.security_group_id]
  Subnet_id         = module.vpc.public_subnet_id
}

// this is for App
module "app_ssh_key_pair" {
  source            = "./module/Ssh-key"
  keyname         = var.L_app_keyname
  public_key_path = var.L_app_public_key_path
}

module "app_security_group" {
  source     = "./module/Security_Group"
  sg_name  = var.L_app_sg_name
  Sg_ports = var.L_app_sg_ports
 // proto    = var.L_app_proto
  Cidr_blocks    = var.L_app_cidrs
  vpc_id   = module.vpc.my_vpc_id

}

module "app_ec2_instance" {
  source               = "./module/Ec2-instance"
  ami_id             = var.L_app_ami_id
  instance_type      = var.L_app_instance_type
  //tags               = var.L_app_tags
  key_name           = module.app_ssh_key_pair.ssh_key_pair_key_name
  security_group_ids = [module.app_security_group.security_group_id]
  Subnet_id          = module.vpc.private_subnet_id
}

// module for alb


module "load_balancer" {
  source     = "./module/Security_Group"
  sg_name  = var.L_lb_sg_name
  Sg_ports = var.L_lb_sg_ports
  //proto    = var.L_lb_proto
  Cidr_blocks   = var.L_lb_cidrs
  vpc_id   = module.vpc.my_vpc_id

}

module "load_balancer_instance" {
  source       = "./module/ALB"
  lb_name    = var.l_lb_name
  lb_type    = var.l_lb_type
  sg_ids     = [module.load_balancer.security_group_id]
  subnet_ids = [module.vpc.public_subnet_id, module.vpc.public_subnet_id2]

}

// module for db subnet group
module "db_sub_grp" {
  source          = "./module/DB-Security-group"
  db_sg_name    = var.l_db_sg_name
  db_subnet_ids = [module.vpc.private_subnet_id, module.vpc.private_subnet_id2]

}
// module for rds 
module "rds_sg" {
  source     = "./module/Security_Group"
  sg_name  = var.L_rds_sg_name
  Sg_ports = var.L_rds_sg_ports
 // proto    = var.L_rds_proto
  Cidr_blocks = var.L_rds_cidrs
  vpc_id   = module.vpc.my_vpc_id
}

// module for rds_instance
module "rds_instance" {
  source                   = "./module/RDS"
  m_db_name                = var.l_db_name
  m_username               = var.l_username
  m_password               = var.l_password
  m_db_subnet_group_name   = module.db_sub_grp.db_name
  m_vpc_security_group_ids = ["${module.rds_sg.security_group_id}"]

}