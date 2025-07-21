variable "vpc_id" {
  description = "ID of the VPC where the security group will be created"
  type        = string
}

variable "ec2_subnet_cidrs" {
  description = "CIDR blocks allowed to access RDS"
  type        = list(string)
}

variable "tags" {
  type = map(string)
}