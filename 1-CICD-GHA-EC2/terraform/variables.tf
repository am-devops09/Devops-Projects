variable "ami" {
  type = string
  default = "ami-0c7217cdde317cfec"
}

variable "region" {
  type = string
  default = "us-east-1"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}
