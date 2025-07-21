variable "instance_count" {
  description = "Number of EC2 instances to launch"
  type        = number
  default     = 1
}

variable "ami_id" {
  description = "AMI ID to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t3.micro"
}

variable "subnet_ids" {
  description = "List of subnet IDs to deploy instances into"
  type        = list(string)
}

variable "security_group" {
  description = "Security group ID to attach to EC2 instances"
  type        = string
}

variable "key_name" {
  description = "Name of the key pair to use for SSH access"
  type        = string
}

variable "user_data" {
  description = "User data script for bootstrapping instance"
  type        = string
  default     = ""
}