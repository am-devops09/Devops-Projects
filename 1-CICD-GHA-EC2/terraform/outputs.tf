output "Instance_puclic_ip" {
  description = "instance public ip"
  value = aws_instance.Ubuntu-ec2.public_ip
}