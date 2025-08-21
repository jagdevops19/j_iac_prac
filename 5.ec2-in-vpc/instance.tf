#Below resouce will be provisioned in the VPC   
resource "aws_instance" "web_server" {
  ami           = lookup(var.ami_id, var.aws_region, "no ami found")
  instance_type = "t2.micro"

  # VPC Subnet
  subnet_id     = aws_subnet.public_subnet-1.id

  #Security Group
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  # public ssh key  
    key_name      = aws_key_pair.j_iac_key.key_name
  tags = {
    Name = "WebServerInstance"
  }
}