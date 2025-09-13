output "instance"{
    value = aws_instance.example.public_ip
}
  output "rds_endpoint"{
    value = aws_db_instance.mariadb.endpoint
    
}