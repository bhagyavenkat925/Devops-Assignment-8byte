provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source               = "./modules/vpc"
  vpc_name             = var.vpc_name
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
  enable_nat_gateway   = var.enable_nat_gateway
  tags                 = var.tags
}

module "security_group" {
  source             = "./modules/security_group"
  vpc_id             = module.vpc.vpc_id
  ec2_subnet_cidrs   = module.vpc.private_subnet_cidrs
  tags               = {
    Environment = "dev"
    Project     = "terraform_assignment"
  }
}

module "ec2" {
  source             = "./modules/ec2"
  instance_count     = var.instance_count
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  subnet_ids         = module.vpc.public_subnet_ids
  key_name           = var.key_name
  security_group     = module.security_group.security_group_id
  user_data          = var.user_data
}

module "rds" {
  source              = "./modules/rds"
  db_identifier       = "assignment-db"
  db_name             = "appdb"
  username            = "adminuser"
  password            = "supersecurepass"           # Use a variable or secret manager in real environments
  engine_version      = "15.13"
  instance_class      = "db.t3.micro"
  allocated_storage   = 20
  private_subnet_ids  = module.vpc.private_subnet_ids
  security_group_id   = module.security_group.security_group_id
  tags                = var.tags
}

module "lb" {
  source            = "./modules/lb"
  public_subnet_ids = module.vpc.public_subnet_ids
  vpc_id            = module.vpc.vpc_id
  instance_ids      = module.ec2.instance_ids
  lb_sg_id          = module.security_group.lb_sg_id  # make sure this exists
  tags              = var.tags
}
