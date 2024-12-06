#Creating the VPC

resource "aws_vpc" "DD-vpc" {
    cidr_block = var.DD-vpc-CIDR
    tags = {
        Name = var.DD-vpc
    }
}

# #Creating two public and four private subnets
# resource "aws_subnet" "PublicSubnet1" {
#     vpc_id = aws_vpc.LE-vpc.id
#     cidr_block = var.PublicSubnet1_CIDR
#     availability_zone = "us-east-1a"
#     tags = {
#         Name = "PublicSubnet1"
#     }
# }

# resource "aws_subnet" "PublicSubnet2" {
#     vpc_id = aws_vpc.LE-vpc.id
#     cidr_block = var.PublicSubnet2_CIDR
#     availability_zone = "us-east-1b"
#     tags = {
#         Name = "PublicSubnet2"
#     }
# }

# resource "aws_subnet" "PrivateSubnet1" {
#     vpc_id = aws_vpc.LE-vpc.id
#     cidr_block = var.PrivateSubnet1_CIDR
#     availability_zone = "us-east-1a"
#     tags = {
#         Name = "PrivateSubnet1"
#     }
# }

# resource "aws_subnet" "PrivateSubnet2" {
#     vpc_id = aws_vpc.LE-vpc.id
#     cidr_block = var.PrivateSubnet2_CIDR
#     availability_zone = "us-east-1b"
#     tags = {
#         Name = "PrivateSubnet2"
#     }
# }

# resource "aws_subnet" "PrivateSubnet3" {
#     vpc_id = aws_vpc.LE-vpc.id
#     cidr_block = var.PrivateSubnet3_CIDR
#     availability_zone = "us-east-1a"
#     tags = {
#         Name = "PrivateSubnet3"
#     }
# }

# resource "aws_subnet" "PrivateSubnet4" {
#     vpc_id = aws_vpc.LE-vpc.id
#     cidr_block = var.PrivateSubnet4_CIDR
#     availability_zone = "us-east-1b"
#     tags = {
#         Name = "PrivateSubnet4"
#     }
# }

# #internet gateway for the public subnets
# resource "aws_internet_gateway" "LE-igw" {
#     vpc_id = aws_vpc.LE-vpc.id
#     tags = {
#         Name = var.igw
#     }
# }


# #Create NAT Gateway 1 for Availability Zone A
# resource "aws_nat_gateway" "LE-vpc-NATGateway1" {
#     allocation_id = aws_eip.LE-EIP1.id
#     depends_on = [aws_internet_gateway.LE-igw, aws_eip.LE-EIP1]
#     subnet_id = aws_subnet.PublicSubnet1.id
#     tags = {
#         Name = var.nat_gw
#     }
# }

# #Create Elastic IP for NAT Gateway 1
# resource "aws_eip" "LE-EIP1" {
#     domain = "vpc"
#     tags = {
#         Name = var.eip
#     }
# } 

# #Create NAT Gateway 2 for Availability Zone B
# resource "aws_nat_gateway" "LE-vpc-NATGateway2" {
#     allocation_id = aws_eip.LE-EIP2.id
#     depends_on = [aws_internet_gateway.LE-igw, aws_eip.LE-EIP2]
#     subnet_id = aws_subnet.PublicSubnet2.id
#     tags = {
#         Name = var.nat_gw2
#     }
# }

# #Create Elastic IP for NAT Gateway 2
# resource "aws_eip" "LE-EIP2" {
#     domain = "vpc"
#     tags = {
#         Name = var.eip2
#     }
# } 

# #Create Public Route Table 
# resource "aws_route_table" "PublicRouteTable" {
#     vpc_id = aws_vpc.LE-vpc.id
#     route {
#             cidr_block = var.all_IPs
#             gateway_id = aws_internet_gateway.LE-igw.id
#         }
#     tags = {
#         Name = "PublicRouteTable"
#     }
# }

# #Associate PublicSubnet1 and PublicSubnet2 with Public Route Table
# resource "aws_route_table_association" "a" {
#     subnet_id = aws_subnet.PublicSubnet1.id
#     route_table_id = aws_route_table.PublicRouteTable.id
# }

# resource "aws_route_table_association" "b" {
#     subnet_id = aws_subnet.PublicSubnet2.id
#     route_table_id = aws_route_table.PublicRouteTable.id
# }

# #Create Private Route Table 
# resource "aws_route_table" "PrivateRouteTable1" {
#     vpc_id = aws_vpc.LE-vpc.id
#     #
#     route {
#             cidr_block = var.all_IPs
#             gateway_id = aws_nat_gateway.LE-vpc-NATGateway1.id
#         }
#     tags = {
#         Name = "PrivateRouteTable1"
#     }
# }
# #Create Private Route Table 2
# resource "aws_route_table" "PrivateRouteTable2" {
#     vpc_id = aws_vpc.LE-vpc.id
#     #
#     route {
#             cidr_block = var.all_IPs
#             gateway_id = aws_nat_gateway.LE-vpc-NATGateway2.id
#         }
#     tags = {
#         Name = "PrivateRouteTable2"
#     }
# }
# #Associate PrivateSubnet1 with Private Route Table
# resource "aws_route_table_association" "c" {
#     subnet_id = aws_subnet.PrivateSubnet1.id
#     route_table_id = aws_route_table.PrivateRouteTable1.id
# }

# #Associate PrivateSubnet2 with Private Route Table
# resource "aws_route_table_association" "d" {
#     subnet_id = aws_subnet.PrivateSubnet2.id
#     route_table_id = aws_route_table.PrivateRouteTable2.id
# }

# #Associate PrivateSubnet3 with Private Route Table
# resource "aws_route_table_association" "e" {
#     subnet_id = aws_subnet.PrivateSubnet3.id
#     route_table_id = aws_route_table.PrivateRouteTable1.id
# }

# #Associate PrivateSubnet4 with Private Route Table
# resource "aws_route_table_association" "f" {
#     subnet_id = aws_subnet.PrivateSubnet4.id
#     route_table_id = aws_route_table.PrivateRouteTable2.id
# }

# #Security groups configurations
# #Security group for ALB
# resource "aws_security_group" "alb_sg" {
#   name        = "le-alb-sg"
#   description = "Security group for ALB"
#   vpc_id = aws_vpc.LE-vpc.id

#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#    ingress {
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   } 

#   egress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     security_groups = [aws_security_group.le_task_sg.id]
#   }
#   tags = {
#     Name = "le-ALB-sg"
#   }
# }

# #Security group for RDS access
# resource "aws_security_group" "RDS-sg" {
#   name = "le-RDS-sg"
#   description = "Allow database access"
#   vpc_id = aws_vpc.LE-vpc.id

#   ingress {
#     from_port = 3306
#     to_port = 3306
#     protocol = "tcp"
#     cidr_blocks = [ aws_vpc.LE-vpc.cidr_block ]
#   }
#   egress {
#     from_port = 0
#     to_port = 0
#     protocol = "-1"
#     cidr_blocks = [ "0.0.0.0/0" ]
#   }
#   tags = {
#     Name = "le-RDS-sg"
#   }
# }

# #Security group for our tasks
# resource "aws_security_group" "le_task_sg" {
#   name        = "le_task_sg" 
#   description = "Security group for the ECS tasks"

#   vpc_id = aws_vpc.LE-vpc.id

#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = [ aws_vpc.LE-vpc.cidr_block ]
#   }
  
#   ingress {
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = [ aws_vpc.LE-vpc.cidr_block ]
#   }
  
#   ingress {
#     from_port   = 3306
#     to_port     = 3306
#     protocol    = "tcp"
#     cidr_blocks = [ aws_vpc.LE-vpc.cidr_block ]
#   } 

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = [ "0.0.0.0/0"]
#   }
 

#   tags = {
#     Name = "le_task_sg"
#   }
# }

# #Security group for the basion host
# resource "aws_security_group" "Bastion-sg" {
#   name = "le-Bastion-sg"
#   description = "Allow ssh to bastion host"
#   vpc_id = aws_vpc.LE-vpc.id

#   ingress {
#     description = "Allow ssh to the bastion host"
#     from_port = 22
#     to_port = 22
#     protocol = "tcp"
#     cidr_blocks = [ "87.23.69.52/32" ] #change this with admin ip address
#   }
#   egress {
#     from_port = 0
#     to_port = 0
#     protocol = "-1"
#     cidr_blocks = [ "0.0.0.0/0" ]
#   }
#   tags = {
#     Name = "le-bastion-sg"
#   }
# }


