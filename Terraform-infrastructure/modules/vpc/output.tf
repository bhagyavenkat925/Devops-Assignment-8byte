output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.assign_vpc.id
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = [for subnet in aws_subnet.public : subnet.id]
}

output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = [for subnet in aws_subnet.private : subnet.id]
}

output "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  value       = aws_internet_gateway.igw.id
}

output "nat_gateway_id" {
  description = "ID of the NAT Gateway"
  value       = aws_nat_gateway.nat.id
}

output "nat_eip" {
  description = "Elastic IP address for NAT Gateway"
  value       = aws_eip.nat.public_ip
}

output "private_subnet_cidrs" {
  value = aws_subnet.private[*].cidr_block
}