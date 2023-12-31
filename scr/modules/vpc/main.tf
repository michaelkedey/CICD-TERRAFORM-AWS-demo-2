#VPC 
resource "aws_vpc" "demo_vpc" {
  cidr_block = var.cidrs["vpc_cidr"]
  tags = {
    Name = "${var.vpc_names["vpc"]}"
  }
  provider = aws.demo
}

#SUBNETS
resource "aws_subnet" "demo_subnet_private1" {
  vpc_id     = aws_vpc.demo_vpc.id
  cidr_block = var.cidrs["demo_subnet_private1"]
  tags = {
    Name = "${var.vpc_names["subnet1"]}"
  }
  provider                = aws.demo
  map_public_ip_on_launch = true
}

resource "aws_subnet" "demo_subnet_private2" {
  vpc_id     = aws_vpc.demo_vpc.id
  cidr_block = var.cidrs["demo_subnet_private2"]
  tags = {
    Name = "${var.vpc_names["subnet2"]}"
  }
  provider = aws.demo
}

#GATEWAY
resource "aws_internet_gateway" "demo_gw" {
  vpc_id = aws_vpc.demo_vpc.id
  tags = {
    Name = var.demogw_name
  }
}

#ROUTE TABLE
resource "aws_route_table" "demo_rt" {
  vpc_id = aws_vpc.demo_vpc.id
  route {
    cidr_block = var.rt_cidr
    gateway_id = aws_internet_gateway.demo_gw.id
  }
  tags = {
    Name = var.demort_name
  }
}

# ASSOCIATE SUBNET WITH RT
resource "aws_route_table_association" "demo_rt" {
  subnet_id      = aws_subnet.demo_subnet_private1.id
  route_table_id = aws_route_table.demo_rt.id
}

#SECURITY GROUP
resource "aws_security_group" "demo_traffic" {
  name     = var.demosg_name
  vpc_id   = aws_vpc.demo_vpc.id
  provider = aws.demo

  ingress {
    from_port   = var.custom_ssh
    to_port     = var.custom_ssh
    protocol    = var.sg_in_protocol[0]
    cidr_blocks = var.sg_cider
  }

  ingress {
    from_port   = var.web
    to_port     = var.web
    protocol    = var.sg_in_protocol[0]
    cidr_blocks = var.sg_cider
  }

  ingress {
    from_port   = var.allow_icmp
    to_port     = var.allow_icmp
    protocol    = var.sg_in_protocol[1]
    cidr_blocks = var.sg_cider
  }

  egress {
    from_port   = var.all
    to_port     = var.all
    protocol    = var.sg_out_protocol
    cidr_blocks = var.sg_cider
  }

  tags = {
    Name = "${var.demosg_name}"
  }
}
