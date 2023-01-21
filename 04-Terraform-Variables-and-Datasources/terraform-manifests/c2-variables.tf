variable "aws_region" {
  description = "Region in which AWS Resource to be created"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "instance_keypair" {
  description = "AWS EC2 key pair that need to be associated with EC2 instance"
  type        = string
  default     = "terraform-key"
}
