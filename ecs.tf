#Configuration cluster
resource "aws_ecs_cluster" "cluster" {
  name = "le_fargate_cluster2"
}

#Configuration task definition
resource "aws_ecs_task_definition" "task_definition" {
  family                   = "le_task_definition2"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = var.AWS_LABROLE_ARN
  task_role_arn            = var.AWS_LABROLE_ARN
  cpu                      = 1024  
  memory                   = 2048

  container_definitions = jsonencode([
    {
      "name": "le-crudapp1",
      "image": "${var.AWS_REPO_URI}",
      "portMappings": [
        {
          "containerPort": 80,
          "hostPort": 80,
          "protocol": "tcp"
        }
      ],
      "environment": [
        {
          "name": "DATABASE_URL",
          "value": "mysql+pymysql://${var.DB_USERNAME}:${var.DB_PASSWORD}@${module.db.db_instance_endpoint}/ledb"
        }
      ],
    }
  ])
}

#Service configuration
resource "aws_ecs_service" "service" {
  name            = "le_service2"
  cluster         = aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.task_definition.arn
  desired_count   = 2
  launch_type     = "FARGATE"
  scheduling_strategy = "REPLICA"

  network_configuration {
    subnets         = [aws_subnet.PrivateSubnet1.id, aws_subnet.PrivateSubnet2.id]
    security_groups = [aws_security_group.le_task_sg.id]
    assign_public_ip = false
  }
  load_balancer {
    target_group_arn = aws_lb_target_group.ecs_target_group.arn
    container_name = "le-crudapp1"
    container_port = 80
  }
  depends_on = [ aws_lb_listener.ecs_listener ] 
}




 