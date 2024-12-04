variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_token" {}

 
# variable "DB_USERNAME" {}
# variable "DB_PASSWORD" {}
# variable "AWS_REPO_URI" {}
# variable "AWS_ECR_ENDPOINT" {}

#basics
variable "aws_region" {}
#variable for the naming of the VPC
variable "DD-vpc" {
    default = "DD-vpc"
    description = "The VPC name"
}

variable "DD-vpc-CIDR" {
    default = "10.0.0.0/16"
    description = "The CIDR block for the custom VPC"
}

# #variables for the declaration of the subnets 
# variable "PublicSubnet1_CIDR" {
#     default = "10.0.1.0/24"
#     description = "CIDR block for Public Subnet 1"
# }
# variable "PublicSubnet2_CIDR" {
#     default = "10.0.2.0/24"
#     description = "CIDR block for Public Subnet 2"
# }

# variable "PrivateSubnet1_CIDR" {
#     default = "10.0.10.0/24"
#     description = "CIDR block for Private Subnet 1"
# }

# variable "PrivateSubnet2_CIDR" {
#     default = "10.0.20.0/24"
#     description = "CIDR block for Private Subnet 2"
# }

# variable "PrivateSubnet3_CIDR" {
#     default = "10.0.30.0/24"
#     description = "CIDR block for Private Subnet 3"
# }

# variable "PrivateSubnet4_CIDR" {
#     default = "10.0.40.0/24"
#     description = "CIDR block for Private Subnet 4"
# }

# variable "igw" {
#     default = "LE-igw"
#     description = "Internet gateway for the VPC"
# }

# #variables for the nat gateways and the Elastic IPs
# variable "nat_gw" {
#     default = "DD-vpc-NATGateway1"
#     description = "NAT Gateway for Private Subnet"
# }

# variable "eip" {
#     default = "LE-EIP1"
#     description = "Elastic IP for NAT Gateway"
# }

# variable "nat_gw2" {
#     default = "DD-vpc-NATGateway2"
#     description = "NAT Gateway for Private Subnet"
# }

# variable "eip2" {
#     default = "LE-EIP2"
#     description = "Elastic IP for NAT Gateway"
# }


# variable "all_IPs" {
#     default = "0.0.0.0/0"
#     description = "All IPs on the internet"
# }

# #The execution policy
# variable "AWS_LABROLE_ARN" {
#   description = "the arn of my labrole execution role"
# }
# variable "name_db" {
#   default = "ledb"
# }
