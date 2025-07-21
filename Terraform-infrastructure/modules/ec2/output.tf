output "instance_ids" {
  value = aws_instance.assignment[*].id
}

output "public_ips" {
  value = aws_instance.assignment[*].public_ip
}

output "private_ips" {
  value = aws_instance.assignment[*].private_ip
}