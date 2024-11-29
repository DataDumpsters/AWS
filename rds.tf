# #Module db to create the database
# module "db" {
#   source = "terraform-aws-modules/rds/aws"

#   identifier = "ledb"
#   engine            = "mysql"
#   engine_version    = "8.0.28"
#   instance_class    = "db.t3.micro"
#   allocated_storage = 100

#   db_name  = "ledb"
#   username = var.DB_USERNAME
#   password = var.DB_PASSWORD
#   port     = "3306"

#   create_db_subnet_group = true
#   subnet_ids             = [aws_subnet.PrivateSubnet4.id, aws_subnet.PrivateSubnet3.id]

#   family = "mysql8.0"

#   major_engine_version = "8.0"
#   publicly_accessible = false
#   apply_immediately = true
#   multi_az = true
#   backup_retention_period = 7
#   manage_master_user_password = false
#   vpc_security_group_ids = [ aws_security_group.RDS-sg.id ]
# }
