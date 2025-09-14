resource "aws_launch_configuration" "example-launchconfig" {
    name_prefix = "example-launchconfig"  
    image_id = lookup(var.AMI_ID, var.aws_region)  #var.AMI_ID[var.aws_region]
    instance_type = "t2.micro"
    key_name = aws_key_pair.j_iac_key.key_name
    security_groups = [aws_security_group.allow-ssh.id]
    lifecycle {
        create_before_destroy = true                                    
}   
}

resource "aws_autoscaling_group" "example-autoscaling" {
    name = "example-autoscaling"
    vpc_zone_identifier = [aws_subnet.public_subnet-1.id]
    max_size = 1
    min_size = 2
    health_check_grace_period = 300
    health_check_type = "EC2"
    desired_capacity = 2
    launch_configuration = aws_launch_configuration.example-launchconfig.name
    tag {
        key = "Name"
        value = "ec2_instance"
        propagate_at_launch = true
    }
}  




    #lifecycle {
    #    create_before_destroy = true                                    
 
