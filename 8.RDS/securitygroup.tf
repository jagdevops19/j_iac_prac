resource "aws_security_group" "example-instance" {
    #security group for the EC2 instance-- allows ssh from public to RDS instance which in private RDS subnet#
  name        = "allow-instance"
  description = "Allow inbound traffic to MariaDB"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  
}
    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  } 
    tags = {
        Name = "allow-instance"
    }
}

resource "aws_security_group" "allow-mariadb" {
    #security group for the RDS instance-- allows traffic from EC2 instance security group#
  name        = "allow-mariadb"
  description = "Allow inbound traffic from EC2 to RDS"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [aws_security_group.example-instance.id] 
  }
    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    self = true  
}   
    tags = {
        Name = "allow-mariadb"
    }
}