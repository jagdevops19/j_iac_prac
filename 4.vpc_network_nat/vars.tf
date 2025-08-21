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
variable "path_to_public_key" {
  description = "The path to the public key file for SSH access"
  type        = string
  default     = "/Users/j/.ssh/j_iac_id_rsa.pub"
  
}
variable "path_to_private_key" {
  description = "The path to the private key file for SSH access"
  type        = string
  default     = "/Users/j/.ssh/j_iac_id_rsa"
}