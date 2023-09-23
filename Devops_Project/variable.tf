
// this is for vpc

variable "L_vpc_cidr" {
  type = string
}

variable "L_availability_zone" {
  type = list
}

variable "L_pvt_cidr" {
  type = list(any)
}

variable "L_pub_cidr" {
  type = list
}

variable "L_destination_cidr" {
  type = string
}



// this is for web 
variable "L_web_keyname" {
  type = string
}

variable "L_web_public_key_path" {
  type = string
}

variable "L_web_ami_id" {
  type = string
}

variable "L_web_instance_type" {
  type = string
}

variable "L_web_sg_name" {
  type = string
}

variable "L_web_sg_ports" {
  type = list(any)
}

variable "L_web_proto" {
  type = string
}

variable "L_web_cidrs" {
  type = list
}


// this is for app
variable "L_app_keyname" {
  type = string
}

variable "L_app_public_key_path" {
  type = string
}

variable "L_app_ami_id" {
  type = string
}

variable "L_app_instance_type" {
  type = string
}
variable "L_app_tags" {
  type = map
}

variable "L_app_sg_name" {
  type = string
}

variable "L_app_sg_ports" {
  type = list(any)
}

variable "L_app_proto" {
  type = string
}

variable "L_app_cidrs" {
  type = list
}

// this is for alb

variable "L_lb_sg_name" {
  type = string
}

variable "L_lb_sg_ports" {
  type = list
}

variable "L_lb_proto" {
  type = string
}

variable "L_lb_cidrs" {
  type = list(any)
}

variable "l_lb_name" {
  type = string
}

variable "l_lb_type" {
  type = string
}


// this is for rds

variable "L_rds_sg_name" {
  type = string
}

variable "L_rds_sg_ports" {
  type = list(any)
}

variable "L_rds_proto" {
  type = string
}

variable "L_rds_cidrs" {
  type = list
}

variable "l_db_name" {
  type = string
}

variable "l_username" {
  type = string
}

variable "l_password" {
  type = string
}


// this is for db_subnet /grp

variable "l_db_sg_name" {
  type = string
}