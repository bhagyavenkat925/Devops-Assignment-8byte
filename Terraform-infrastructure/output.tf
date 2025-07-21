# VPC
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

# EC2
output "ec2_instance_ids" {
  value = module.ec2.instance_ids
}

output "ec2_public_ips" {
  value = module.ec2.public_ips
}

# RDS
output "rds_endpoint" {
  value = module.rds.rds_endpoint
}

# Security Groups
output "ec2_sg_id" {
  value = module.security_group.ec2_sg_id
}

output "rds_sg_id" {
  value = module.security_group.rds_sg_id
}

# Load Balancer 
output "lb_dns_name" {
  value = module.lb.lb_dns_name
}