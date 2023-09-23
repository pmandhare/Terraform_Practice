#Load Balancer for WEB

resource "aws_lb" "Hilton-lb" {
  name               = var.lb_name
  load_balancer_type = var.lb_type
  security_groups    = var.sg_ids
 subnets            = var.subnet_ids
}