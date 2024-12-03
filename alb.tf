# #Creating the ALB 
# resource "aws_lb" "alb" {
#   name               = "le-alb"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = [aws_security_group.alb_sg.id]
#   subnets            = [aws_subnet.PublicSubnet1.id, aws_subnet.PublicSubnet2.id]

#   enable_deletion_protection = false
  
#   tags = {
#     Name = "le-alb"
#   }
# }

# #ECS target group configuration
# resource "aws_lb_target_group" "ecs_target_group" {
#   name        = "le-target-group"
#   port        = 80
#   protocol    = "HTTP"
#   vpc_id = aws_vpc.LE-vpc.id
#   target_type = "ip"
  
#   stickiness {
#     type            = "lb_cookie"
#     cookie_duration = 3600
#   }

#   health_check {
#     path                = "/"
#     protocol            = "HTTP"
#     port                = 80
#     interval            = 30
#     timeout             = 10
#     healthy_threshold   = 3
#     unhealthy_threshold = 3
#   }
# }

# #Listener rule for the ALB
# resource "aws_lb_listener_rule" "ecs_listener_rule" {
 
#   listener_arn = aws_lb_listener.ecs_listener.arn
#   priority     = 100

#   action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.ecs_target_group.arn
#   }

#   condition {
#     path_pattern {
#       values = ["/*"]
#     }
#   }
  
# }

# #Listener for the ALB
# resource "aws_lb_listener" "ecs_listener" {
#   load_balancer_arn = aws_lb.alb.arn
#   port              = 80
#   protocol          = "HTTP"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.ecs_target_group.id
#   }
# }