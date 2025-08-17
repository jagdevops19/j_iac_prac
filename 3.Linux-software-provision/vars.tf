variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "eu-west-2"
  
}

variable "aws_profile" {
  description = "The AWS profile to use for authentication"
  type        = string
  default     = "terraform"
}

variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance"
  type        = map(string)
  default     = {
    "eu-west-1" = "ami-0c55b159cbfafe1f0" # Example AMI ID for Ubuntu 20.04 in eu-west-2
    "eu-west-2" = "ami-0cb226682278979e9" # Example AMI ID for Ubuntu 20.04 in us-east-1
    "eu-east-1" = "ami-0c55b159cbfafe1f0" # Example AMI ID for Ubuntu 20.04 in us-east-2
    
  }
  
}
variable "path_to_public_key" {
  description = "The path to the public key file for SSH access"
  type        = string
  default     = "/Users/j/.ssh/j_iac_id_rsa.pub"
  #default     = "~/.ssh/id_rsa.pub"
  
}
variable "path_to_private_key" {
  description = "The path to the private key file for SSH access"
  type        = string
  default     = "/Users/j/.ssh/j_iac_id_rsa"
  #default     = "~/.ssh/id_rsa"
  
}
variable "instance_username" {
  description = "The type of EC2 instance to launch"
  type        = string
  default     = "ubuntu"    
}