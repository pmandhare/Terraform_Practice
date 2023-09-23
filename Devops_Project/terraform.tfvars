

// this is for web 
L_web_keyname         = "web-ssh-key"
L_web_public_key_path = "/root/.ssh/id_rsa.pub"
L_web_ami_id          = "ami-05552d2dcf89c9b24"
L_web_instance_type   = "t2.micro"
L_web_tags            = { Name = "web-instance" }
L_web_sg_name         = "web-sg"
L_web_sg_ports        = [22, 80, 443]
L_web_proto           = "tcp"
L_web_cidrs           = ["0.0.0.0/0"]



// this is for app

L_app_keyname         = "app-ssh-key"
L_app_public_key_path = "/root/.ssh/id_rsa.pub"
L_app_ami_id          = "ami-05552d2dcf89c9b24"
L_app_instance_type   = "t2.micro"
L_app_tags            = { Name = "app-instance" }
L_app_sg_name         = "app-sg"
L_app_sg_ports        = [22, 8080]
L_app_proto           = "tcp"
L_app_cidrs           = ["0.0.0.0/0"]


// this is for vpc
L_vpc_cidr          = "10.0.0.0/16"
L_availability_zone = ["ap-south-1a", "ap-south-1b"]
L_pvt_cidr          = ["10.0.2.0/24", "10.0.3.0/24"]
L_pub_cidr          = ["10.0.0.0/24", "10.0.1.0/24"]
L_destination_cidr  = "0.0.0.0/0"



//this is for lb

L_lb_sg_name  = "lb-sg"
L_lb_sg_ports = [80, 443]
L_lb_proto    = "tcp"
L_lb_cidrs    = ["0.0.0.0/0"]
l_lb_name     = "3T-application-lb"
l_lb_type     = "application"



// this is rds

L_rds_sg_name  = "rds-sg"
L_rds_sg_ports = [3306]
L_rds_proto    = "tcp"
L_rds_cidrs    = ["0.0.0.0/0"]
l_rds_name     = "rds_3tier"
l_rds_type     = "rds"
l_db_name      = "pooja"
l_username     = "pooja123"
l_password     = "pooja124"


//db subnet group
l_db_sg_name = "db_sg"
