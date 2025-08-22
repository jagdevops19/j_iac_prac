variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "eu-west-2"
  
}
variable "path_to_public_key" {
  description = "Path to the public key file for SSH access"
  type        = string
  default     = "/Users/j/.ssh/j_iac_id_rsa.pub"
}
variable "path_to_private_key" {
  description = "Path to the private key file for SSH access"
  type        = string
  default     = "/Users/j/.ssh/j_iac_id_rsa"
  
}
variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance"
  type        = map(string) # Using a map to allow for different AMIs per region
  default     = {
    "eu-west-2" = "ami-0cb226682278979e9", # Example AMI ID for eu-west-2, replace with a valid one
    "us-east-1" = "ami-0c55b159cbfafe1f0", # Example AMI ID for us-east-1, replace with a valid one
    "us-west-1" = "ami-0c55b159cbfafe", # Example AMI ID for us-west-1, replace with a valid on
}   
}