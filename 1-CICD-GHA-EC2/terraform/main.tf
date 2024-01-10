resource "aws_instance" "Ubuntu-ec2" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = "am-devops24"
  security_groups = ["${aws_security_group.UbuntuSG.name}"]
  tags = {
    Name = "Ubuntu-EC2"
    Environment = "Dev"
  }
}
resource "aws_security_group" "UbuntuSG" {
    ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks  = ["0.0.0.0/0"]
  }

    ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks  = ["0.0.0.0/0"]
  }

  egress  {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}