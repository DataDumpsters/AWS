#  #Creating an elastic ip addres for the bastion host
# resource "aws_eip" "bastion_host_ip" {
#   instance = aws_instance.bastion_host.id
# }

# #Creating the bastion host
# resource "aws_instance" "bastion_host" {
#   ami           = "ami-07d9b9ddc6cd8dd30"  
#   instance_type = "t2.micro"            
#   #key_name      = "le_key"
#   subnet_id     = aws_subnet.PublicSubnet1.id 
#   security_groups = [aws_security_group.Bastion-sg.id]
#   tags = {
#     Name = "Bastion Host1"
#   }
#   lifecycle {
#     ignore_changes = [ security_groups ]
#   }
#    provisioner "remote-exec" {
#     inline = [
#       "sudo apt update",
#       "sudo apt install -y mysql-client-core-8.0", 
#       "sudo apt update"
#     ]
#   } 
#   depends_on = [ aws_vpc.LE-vpc, aws_internet_gateway.LE-igw ]
# } 

# #Creating the keys to make ssh to the bastion host possible
# # resource "aws_key_pair" "le_key" {
# #    key_name = "le_key"
# #    public_key = tls_private_key.rsa.public_key_openssh
# # }
 
# # resource "tls_private_key" "rsa" {
# #    algorithm = "RSA"
# #    rsa_bits = 4096
# # }

# # resource "local_file" "le_key" {
# #    content = tls_private_key.rsa.private_key_pem
# #    filename = "lekey"
# # }
