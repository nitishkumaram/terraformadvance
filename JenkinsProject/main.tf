# EC2 Instance to host Jenkins
resource "aws_instance" "JenkinsEc2" {
  ami           = var.ami
  instance_type = var.instancetype
  tags = {
    "Name" = "JenkinsEC2"
  }
}