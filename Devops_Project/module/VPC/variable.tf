variable "vpc_cidr" {
  type = string
}

variable "availability_zone" {
  type = list
}

variable "pvt_cidr" {
  type = list
}

variable "pub_cidr" {
  type = list
}

variable "destination_cidr" {
  type = string
}