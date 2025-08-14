# You can use this URL here at the bottom, "https://cloud-images.ubuntu.com/locator/ec2/" to look up your "AMI-IDs".


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
        "eu-west-2" = "ami-0cb226682278979e9"  # EU London Example AMI ID for us-west-2
        "us-east-1" = "ami-0c55b159cbfafe1f0"  # US N.virginia Example AMI ID for us-east-1
        "eu-west-1" = "ami-0c55b159cbfafe"  # US N.virginia Example AMI ID for eu-west-1
    }
}