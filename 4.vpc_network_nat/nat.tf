#eip

resource "aws_eip" "nat_eip" {
  domain = "vpc"
  tags = {
    Name    = "nat-eip"
    project = "vpc_network"
  }
  
}

#nat gateway
resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet-1.id
  depends_on = [aws_internet_gateway.main-gw]   
  tags = {
    Name    = "nat-gw"
    project = "vpc_network"
    }   
}

#VPC setup for NAT
resource "aws_route_table" "nat_route_table" {
  vpc_id = aws_vpc.main.id
  
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat-gw.id
    }       
  tags = {
    Name    = "nat-route-table"
    project = "vpc_network"
  }
}   

#Route Table Association for Private Subnets
resource "aws_route_table_association" "private_subnet-1_rt_assoc" {    
  subnet_id      = aws_subnet.private_subnet-1.id
  route_table_id = aws_route_table.nat_route_table.id
}                   
resource "aws_route_table_association" "private_subnet-2_rt_assoc" {    
  subnet_id      = aws_subnet.private_subnet-2.id
  route_table_id = aws_route_table.nat_route_table.id
}
resource "aws_route_table_association" "private_subnet-3_rt_assoc" {    
  subnet_id      = aws_subnet.private_subnet-3.id
  route_table_id = aws_route_table.nat_route_table.id
}