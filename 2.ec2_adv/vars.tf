variable "aws_region" {
  default     = "eu-west-2" # Change this to your desired region
}
variable "aws_profile" {
  description = "The AWS profile to use for authentication"
  default     = "terraform" # Change this to your desired AWS profile

}
variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance"
  type        = map(string)
  default     = {
    eu-west-1 = "ami-0e52b5f0b50d5c811" # EU Ireland
    eu-west-2 = "ami-0cb226682278979e9" # EU London
    eu-east-1 = "mi-00d4e9ff62bc40e03"  # US N.virginia
  }   
  
}