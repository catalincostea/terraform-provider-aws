resource "aws_alb" "alb" {
  name            = "${var.name}-alb-${var.environment}"
  internal        = true
  security_groups = ["${var.security_group_id}"]
  subnets         = ["${split(",", var.subnet_ids)}"]
tags {
    Environment = "${var.environment}"
  }
}

#https://hackernoon.com/configuring-the-new-alb-host-based-routing-with-terraform-358361bad12b