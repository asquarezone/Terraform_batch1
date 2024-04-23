# create a network load balancer
resource "aws_lb" "kids" {
  name               = "kids-lb"
  internal           = false
  load_balancer_type = "network"
  security_groups    = [aws_security_group.web.id]
  subnets            = [for subnet in aws_subnet.public_subnets : subnet.id]
  tags = {
    Name        = "kids-lb"
    Environment = terraform.workspace
  }
  depends_on = [
    aws_instance.web1,
    aws_instance.web2
  ]
}

resource "aws_lb_target_group" "kids" {
  name     = "kids-lb-tg"
  port     = 80
  protocol = "TCP"
  vpc_id   = aws_vpc.network.id
  depends_on = [
    aws_instance.web1,
    aws_instance.web2
  ]
}

resource "aws_lb_listener" "kids" {
  load_balancer_arn = aws_lb.kids.arn
  port              = 80
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.kids.arn
  }
  depends_on = [
    aws_instance.web1,
    aws_instance.web2,
    aws_lb.kids,
    aws_lb_target_group.kids
  ]
}


resource "aws_lb_target_group_attachment" "web1" {

  target_group_arn = aws_lb_target_group.kids.arn
  target_id        = aws_instance.web1.id
  port             = 80
  depends_on = [
    aws_instance.web1,
    aws_instance.web2,
    aws_lb.kids,
    aws_lb_target_group.kids
  ]
}


resource "aws_lb_target_group_attachment" "web2" {

  target_group_arn = aws_lb_target_group.kids.arn
  target_id        = aws_instance.web2.id
  port             = 80
  depends_on = [
    aws_instance.web1,
    aws_instance.web2,
    aws_lb.kids,
    aws_lb_target_group.kids
  ]
}