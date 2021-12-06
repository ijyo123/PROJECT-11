#Create VPC
resource "aws_vpc" "project11VPC" {
  cidr_block       = var.project11VPC
  instance_tenancy = "default"

  tags = {
    Name = var.P11VPC-nametag
  }
}

#Create Public Subnet1
resource "aws_subnet" "p11-pubsub1" {
  vpc_id     = aws_vpc.project11VPC.id
  cidr_block = var.p11-pubsub1-cidr
  availability_zone = "eu-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = var.p11-pubsub1-name
  }
}

#Create Public Subnet2
resource "aws_subnet" "p11-pubsub2" {
  vpc_id     = aws_vpc.project11VPC.id
  cidr_block = var.p11-pubsub2-cidr
  availability_zone = "eu-west-2b"
  map_public_ip_on_launch= true

  tags = {
    Name = var.p11-pubsub2-name
  }
}

#Create Private Subnets
resource "aws_subnet" "p11-privsub1" {
  vpc_id     = aws_vpc.project11VPC.id
  cidr_block = var.p11-privsub1-cidr
  availability_zone = "eu-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = var.p11-privsub1-name
  }
}

resource "aws_subnet" "p11-privsub2" {
  vpc_id     = aws_vpc.project11VPC.id
  cidr_block = var.p11-privsub2-cidr
  availability_zone = "eu-west-2b"
  map_public_ip_on_launch = true

  tags = {
    Name = var.p11-privsub2-name
  }
}

#Create Route Table for Public Routes
resource "aws_route_table" "p11-publicroutetable" {
  vpc_id = aws_vpc.project11VPC.id

  tags = {
    Name = var.p11-publicroutetable-name
  }
}

#Create Route Table for Private Routes
resource "aws_route_table" "p11-privateroutetable" {
  vpc_id = aws_vpc.project11VPC.id

  tags = {
    Name = var.p11-privateroutetable-name
  }
}

#Create RTA for Public Subnet1
resource "aws_route_table_association" "publicp11-rta1" {
  subnet_id      = aws_subnet.p11-pubsub1.id
  route_table_id = aws_route_table.p11-publicroutetable.id
}

#Create RTA for Public Subnet2
resource "aws_route_table_association" "publicp11-rta2" {
  subnet_id      = aws_subnet.p11-pubsub2.id
  route_table_id = aws_route_table.p11-privateroutetable.id
}

#Create RTA for Private Subnet1
resource "aws_route_table_association" "privatep11-rta1" {
  subnet_id      = aws_subnet.p11-privsub1.id
  route_table_id = aws_route_table.p11-privateroutetable.id
}

#Create RTA for Private Subnet2
resource "aws_route_table_association" "privatep11-rta2" {
  subnet_id      = aws_subnet.p11-privsub2.id
  route_table_id = aws_route_table.p11-privateroutetable.id
}

#Create IGW
resource "aws_internet_gateway" "Project11-igw" {
  vpc_id = aws_vpc.project11VPC.id

  tags = {
    Name = var.Project11-igw-name
  }
}

#Create Route for IGW
resource "aws_route" "publicp11-igw-route" {
  route_table_id            = aws_route_table.p11-publicroutetable.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                =aws_internet_gateway.Project11-igw.id
  }