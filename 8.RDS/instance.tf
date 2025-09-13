resource "aws_instance" "example" {
  ami = var.AMI_ID[var.aws_region]
  instance_type = "t2.micro"

# VPC subnet for the EC2 instance
  subnet_id = aws_subnet.public_subnet-1.id

# the public ssh key to access the instance
  key_name = aws_key_pair.j_iac_key.key_name

#security group to allow ssh from public to the instance
  vpc_security_group_ids = [aws_security_group.example-instance.id]
  
    tags = {
        Name = "example-instance"   
  }
}