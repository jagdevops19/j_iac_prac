#VPC    
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "main-vpc"
  }
}                       
#Public Subnets 

resource "aws_subnet" "public_subnet-1" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
    availability_zone = "eu-west-2a"
    map_public_ip_on_launch = true  
    tags = {
      Name = "public_subnet-1"
    }
}

resource "aws_subnet" "public_subnet-2" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
    availability_zone = "eu-west-2b"
    map_public_ip_on_launch = true  
    tags = {
      Name = "public_subnet-2"
    }   
  
}

resource "aws_subnet" "public_subnet-3" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.3.0/24"
    availability_zone = "eu-west-2c"
    map_public_ip_on_launch = true  
    tags = {
      Name = "named_subnet-3"
    }
  
}

#Private Subnets
resource "aws_subnet" "private_subnet-1" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.4.0/24"
    availability_zone = "eu-west-2a"
    tags = {
      Name = "private_subnet-1"
    }
}     
resource "aws_subnet" "private_subnet-2" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.5.0/24"
    availability_zone = "eu-west-2b"
    tags = {
      Name = "private_subnet-2"
    }
}
resource "aws_subnet" "private_subnet-3" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.6.0/24"
    availability_zone = "eu-west-2c"
    tags = {
      Name = "private_subnet-3"
    }
} 

#Internet Gateway
resource "aws_internet_gateway" "main-gw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "main-gateway"
  }
}
#Route Table for Public Subnets
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/24"
    gateway_id = aws_internet_gateway.main-gw.id
  }
  tags = {
    Name = "public-route-table"
  } 
  }
#Route Table Association for Public Subnets
resource "aws_route_table_association" "public_subnet-1" {
  subnet_id = aws_subnet.public_subnet-1.id
  route_table_id = aws_route_table.public_rt.id
} 
resource "aws_route_table_association" "public_subnet-2" {
  subnet_id = aws_subnet.public_subnet-2.id
  route_table_id = aws_route_table.public_rt.id
}
resource "aws_route_table_association" "public_subnet-3" {
  subnet_id = aws_subnet.public_subnet-3.id
  route_table_id = aws_route_table.public_rt.id
} 