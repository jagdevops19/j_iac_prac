variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "eu-west-2"
  
}
variable "path_to_public_key" {
    default     = "/Users/j/.ssh/j_iac_id_rsa.pub"                       
}   
variable "path_to_private_key" {
    default     = "/Users/j/.ssh/j_iac_id_rsa"   
  
}
variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance"
  type        = map(string)
  default = {
    "eu-west-1" = "ami-0c55b159cbfafe1f0" # Example AMI ID for Ubuntu 20.04 in eu-west-2
    "eu-west-2" = "ami-0cb226682278979e9" # Example AMI ID for Ubuntu 20.04 in us-east-1
    "eu-east-1" = "ami-0c55b159cbfafe1f0" # Example AMI ID for Ubuntu 20.04 in us-east-2
    
  }     

}
variable "mybucketname" {
    default     = "j-iac-mybucket"                       
}