# Create a new load balancer
resource "aws_elb" "project11-alb" {
  name               = "project11-alb"
  subnets = [
    aws_subnet.p11-pubsub2.id,
    aws_subnet.p11-pubsub2.id
  ]

  

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 5
    unhealthy_threshold = 5
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  tags = {
    Name = var.project11-alb-tagname
  }
}