# Output Values of different resources
output "EC2IP" {
  value = aws_instance.JenkinsEc2.public_ip
}