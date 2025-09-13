resource "aws_db_subnet_group" "mariadb-subnet" {
    name       = "mariadb-subnet"
    description = "subnet group for mariadb"
    subnet_ids = [aws_subnet.private_subnet-1.id, aws_subnet.private_subnet-2.id, aws_subnet.private_subnet-3.id]
}

resource "aws_db_parameter_group" "mariadb-parameters" {
    name = "mariadb-paremeters"
    family = "mariadb10.6"
    description = "mariadb parameter group"
    parameter {
        name = "character_set_server"
        value = "utf8mb4"
    }
 } 

resource "aws_db_instance" "mariadb" {
    identifier = "mariadb-instance"
    allocated_storage = 20
    engine = "mariadb"
    engine_version = "10.6.23"
    instance_class = "db.t3.micro"
    #name = "mydb"
    username = "root"         #var.db_username
    password = var.RDS_PASSWORD               #var.db_password
    db_subnet_group_name = aws_db_subnet_group.mariadb-subnet.name
    vpc_security_group_ids = [aws_security_group.allow-mariadb.id]
    parameter_group_name = aws_db_parameter_group.mariadb-parameters.name
    multi_az = false ## set to true to have high availability: 2 instances synchronized with each other
    storage_type = "gp2"
    backup_retention_period = 30    # how many days to retain backups  
    #backup_window = "07:00-09:00"  # daily time range to perform backups
    #maintenance_window = "Mon:03:00-Mon:04:00"  # weekly time range to perform maintenance
    availability_zone = aws_subnet.private_subnet-1.availability_zone #prefered AZ
    skip_final_snapshot = true
    publicly_accessible = false
    tags = {
        Name = "mariadb-instance"
    }
  
}