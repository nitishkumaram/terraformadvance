# EC2 Instance to host Jenkins
resource "aws_instance" "JenkinsEc2" {
  ami           = var.ami
  instance_type = var.instancetype
  key_name      = var.instance_keypair
  user_data     = file("${path.module}/app1-install.sh")
  # vpc_security_group_ids = [
  #   aws_security_group.vpc-ssh.id, aws_security_group.vpc_web.id
  # ]
   vpc_security_group_ids = [aws_security_group.vpc_web.id]
  tags = {
    "Name" = "JenkinsEC2"
  }
}
# Create Security Group- SSH Traffic
# resource "aws_security_group" "vpc-ssh" {
#   name        = "vpc-ssh"
#   description = "VPC SSH"
#   ingress {
#     description = "Allow port 22"
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   egress {
#     description = "Allow all ip and ports outbound"
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   tags = {
#     name = "vpc-ssh"
#   }
# }
# Create Security Group - Web Traffic
resource "aws_security_group" "vpc_web" {
  name        = "vpc-web"
  description = "VPC SG WEB"
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow Port 8080"
    from_port   = 8080
    protocol    = "tcp"
    to_port     = 8080
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow Port 443"
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
  }
  egress {
    description = "Allow all ip and ports outbound"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "vpc-web"
  }
}