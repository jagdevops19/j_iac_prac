#VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"    
  instance_tenancy = "default"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
    tags = {    
    Name = "main-vpc" #vpn name
    project = "vpc_network" #project name
    }
}
#Public Subnets
resource "aws_subnet" "public_subnet-1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
    availability_zone = "eu-west-2a" # default = "eu-west-2"
    map_public_ip_on_launch = true  
    tags = {
    Name = "public-subnet-1" #subnet name
    project = "vpc_network" #project name   
    }
}
resource "aws_subnet" "public_subnet-2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24" 
    availability_zone = "eu-west-2b" # default = "eu-west-2"
    map_public_ip_on_launch = true  
    tags = {
    Name = "public-subnet-2" #subnet name
    project = "vpc_network" #project name   
    }   
}
resource "aws_subnet" "public_subnet-3" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.3.0/24" 
    availability_zone = "eu-west-2c" # default = "eu-west-2"
    map_public_ip_on_launch = true  
    tags = {
    Name = "public-subnet-3" #subnet name
    project = "vpc_network" #project name   
    }       
}   

#Private Subnets
resource "aws_subnet" "private_subnet-1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.4.0/24" 
  map_public_ip_on_launch = "false"
    availability_zone = "eu-west-2a" # default = "eu-west-2"
    tags = {
    Name = "private-subnet-1" #subnet name
    project = "vpc_network" #project name   
    }   
}
resource "aws_subnet" "private_subnet-2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.5.0/24"
  map_public_ip_on_launch = "false"
    availability_zone = "eu-west-2b" # default = "eu-west-2"
    tags = {
    Name = "private-subnet-2" #subnet name
    project = "vpc_network" #project name   
    }
}
resource "aws_subnet" "private_subnet-3" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.6.0/24"   
    map_public_ip_on_launch = "false"
        availability_zone = "eu-west-2c" # default = "eu-west-2"
        tags = {
        Name = "private-subnet-3" #subnet name
        project = "vpc_network" #project name   
        }
}

#Internet Gateway
resource "aws_internet_gateway" "main-gw" {
    vpc_id = aws_vpc.main.id
    tags = {
        Name = "main-gateway" #gateway name
        project = "vpc_network" #project name   
    }
    }

#Route Table for Public Subnets
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-gw.id
  }
  tags = {  
    Name = "public-route-table" #route table name
    project = "vpc_network" #project name   
  }
}   
#Route Table Association for Public Subnets     
resource "aws_route_table_association" "public_subnet-1" {
  subnet_id      = aws_subnet.public_subnet-1.id
  route_table_id = aws_route_table.public_rt.id
}
resource "aws_route_table_association" "public_subnet-2" {
  subnet_id      = aws_subnet.public_subnet-2.id
  route_table_id = aws_route_table.public_rt.id
}
resource "aws_route_table_association" "public_subnet-3" {
  subnet_id      = aws_subnet.public_subnet-3.id
  route_table_id = aws_route_table.public_rt.id
}