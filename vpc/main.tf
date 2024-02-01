resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags =  {
    name = "vpc/feature-01"
  }
}

resource "aws_subnet" "pubic-subnet" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.subnet_cidr_01
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    name = "subnet-01_public"
  }
}

resource "aws_subnet" "pubic-subnet-02" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.subnet_cidr_02
  availability_zone = "ap-south-1b"
  map_public_ip_on_launch = true

  tags = {
    name = "subnet-02_public"
  }
}

resource "aws_internet_gateway" "igw" {
   vpc_id = aws_vpc.vpc.id

   tags = {
     name = "igw"
   }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  depends_on = [ aws_internet_gateway.igw ]
}

resource "aws_route_table_association" "rt-assoc" {
  route_table_id = aws_route_table.rt.id
  subnet_id = aws_subnet.pubic-subnet.id
}

resource "aws_route_table_association" "rt-assoc-01" {
  route_table_id = aws_route_table.rt.id
  subnet_id = aws_subnet.pubic-subnet-02.id
}