vpc_name             = "dev-vpc"
vpc_cidr             = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
availability_zones   = ["ap-south-1a", "ap-south-1b"]
enable_nat_gateway   = true
tags = {
  Environment = "dev"
  Project     = "terraform_demo"
}

instance_count      = 1
ami_id = "ami-03f4878755434977f"  # ← for Amazon Linux 2 in ap-south-1 
key_name            = "my-ssh-key"            
security_group_id   = "sg-0123456789abcdef0"  
user_data           = ""

db_identifier     = "assignment-db"
db_name           = "appdb"
username          = "adminuser"
password          = "supersecurepass"    # You can encrypt this later
engine_version    = "15.13"
instance_class    = "db.t3.micro"
allocated_storage = 20