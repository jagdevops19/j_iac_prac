resource "aws_s3_bucket" "bucket" {
    bucket = var.mybucketname
    acl  = "private"
    
    tags = {
        Name = var.mybucketname   
        }
}