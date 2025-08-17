resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  }
  
resource "aws_subnet" "main" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
}
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
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
}
resource "aws_key_pair" "j_iac_id_rsa" {
    public_key = file(var.path_to_public_key)
  
}
resource "aws_instance" "example" {
  ami = lookup(var.ami_id, var.aws_region)
    instance_type = "t2.micro"  
    subnet_id     = aws_subnet.main.id
    key_name      = aws_key_pair.j_iac_id_rsa.key_name
    #vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    associate_public_ip_address = true
    
    provisioner "file" {
        source      = "script.sh"
        destination = "/Users/j/script.sh"
        connection {
            type        = "ssh"
            user        = var.instance_username
            private_key = file(var.path_to_private_key)
            host        = self.public_ip
        }          
      
    }

provisioner "local-exec" {
    command = "sleep 300"
}

    provisioner "remote-exec" {
        inline = [
            "chmod +x /Users/j/script.sh",
            "sudo /Users/j/script.sh"
        ]
        connection {
            type        = "ssh"
            user        = var.instance_username
            private_key = file(var.path_to_private_key)
            host        = self.public_ip
        }
    }


tags = {
    Name = "nginx-server"
  }
}



