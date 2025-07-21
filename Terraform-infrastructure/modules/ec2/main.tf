resource "aws_instance" "assignment" {
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_ids[count.index]
  key_name      = var.key_name
  vpc_security_group_ids = [var.security_group]

  tags = {
    Name = "assignment_instance-${count.index}"
  }

  user_data_base64 = var.user_data

  associate_public_ip_address = true  
}