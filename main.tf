module "ec2" {
  source          = "./scr/modules/ec2"
  subnet_id       = module.vpc.private_subnet1_id
  security_groups = module.vpc.security_group_id
}

module "vpc" {
  source = "./scr/modules/vpc"
}

module "s3" {
  source = "./scr/modules/s3"
}
    