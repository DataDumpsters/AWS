# #Endpoint of the database 
# output "endpoint-db" {
#     value = module.db.db_instance_endpoint
#     sensitive = true
# }

# #DNS name from the load balancer 
# output "dns_name_loadblancer" {
#   value = aws_lb.alb.dns_name
# }

# #IP address to connect to for ssh connection
# output "ip_bastionhost" {
#   value = aws_eip.bastion_host_ip.public_ip
# }
