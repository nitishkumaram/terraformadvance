variable "aws_region" {
  description = "Region"
  default     = "us-east-1"
}

variable "ami" {
  description = "AMI ID of the amazon EC2 instance"
  default     = "ami-0b5eea76982371e91"
}

variable "instancetype" {
  description = "Type of the instance"
  default     = "t2.micro"
}