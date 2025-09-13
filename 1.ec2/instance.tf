resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
    #cidr_block = "172.31.0.0/16"
}
resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
    cidr_block = "10.0.1.0/24"
    #cidr_block = "172.31.16.0/20"
}
resource "aws_instance" "example" {
  ami           = lookup(var.ami_id, var.aws_region, "ami not found") # Default to us-east-1 if region not found
  instance_type = "t2.micro"
   subnet_id     = aws_subnet.main.id

  tags = {
    Name = "example-instance"
  }
}

#ami           = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI (HVM), SSD Volume Type - us-east-1
#in