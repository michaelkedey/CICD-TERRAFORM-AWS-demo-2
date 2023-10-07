module "ec2" {
  source = "./src/modules/ec2"
}

module "vpc" {
  source = "./src/modules/vpc"
}

module "s3" {
  source = "./src/modules/s3"
}