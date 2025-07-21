# ───── VPC ─────
variable "vpc_name" {}
variable "vpc_cidr" {}
variable "public_subnet_cidrs" {
  type = list(string)
}
variable "private_subnet_cidrs" {
  type = list(string)
}
variable "availability_zones" {
  type = list(string)
}
variable "enable_nat_gateway" {
  type = bool
}
variable "tags" {
  type = map(string)
}

# ───── EC2 ─────
variable "instance_count" {
  default = 1
}
variable "ami_id" {}
variable "instance_type" {
  default = "t3.micro"
}
variable "key_name" {}
variable "security_group_id" {}
variable "user_data" {
  default = ""
}

# ───── RDS ─────
variable "db_identifier" {}
variable "db_name" {}
variable "username" {}
variable "password" {}
variable "engine_version" {
  default = "15.13"
}
variable "instance_class" {
  default = "db.t3.micro"
}
variable "allocated_storage" {
  default = 20
}