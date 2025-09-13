variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "eu-west-2"
  
}
variable "path_to_public_key" {
  description = "Path to the public key"
  type        = string
  default     = "/Users/j/.ssh/j_iac_id_rsa.pub"     
  
}   
variable "path_to_private_key" {
  description = "Path to the private key"
  type        = string
  default     = "/Users/j/.ssh/j_iac_id_rsa"     
  
}
variable "AMI_ID" {
  description = "The AMI ID to use for the EC2 instance"
  type        = map(string)
  default     = {
    eu-west-1 = "ami-0e52b5f0b50d5c811" # EU Ireland
    eu-west-2 = "ami-0cb226682278979e9" # EU London
    us-east-1 = "ami-00d4e9ff62bc40e03" # US N.virginia
  }   
  
}
variable "RDS_PASSWORD" { }