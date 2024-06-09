provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}

provider "aws" {
  alias  = "us_east_2"
  region = "us-east-2"
}

module "vpc_us_east_1" {
  source = "./modules/VPC"
  region = "us-east-1"
  providers = {
    aws = aws.us_east_1
  }
}

module "vpc_us_east_2" {
  source = "./modules/VPC"
  region = "us-east-2"
  providers = {
    aws = aws.us_east_2
  }
}

module "ec2_us_east_1" {
  source             = "./modules/EC2_Instance"
  region             = "us-east-1"
  public_subnet_id   = module.vpc_us_east_1.public_subnet_id
  private_subnet_id  = module.vpc_us_east_1.private_subnet_id
  security_group_id  = module.vpc_us_east_1.security_group_id
  ami                = "ami-04e8b3e527208c8cf"
  providers = {
    aws = aws.us_east_1
  }
}

module "ec2_us_east_2" {
  source             = "./modules/EC2_Instance"
  region             = "us-east-2"
  public_subnet_id   = module.vpc_us_east_2.public_subnet_id
  private_subnet_id  = module.vpc_us_east_2.private_subnet_id
  security_group_id  = module.vpc_us_east_2.security_group_id
  ami                = "ami-0db513e73ed5a7faa"
  providers = {
    aws = aws.us_east_2
  }
}
