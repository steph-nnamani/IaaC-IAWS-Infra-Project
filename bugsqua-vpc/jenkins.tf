data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "jenkins_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = module.vpc.private_subnets[0]
  vpc_security_group_ids = [aws_security_group.jenkins-sg.id]
  associate_public_ip_address = false
  user_data                   = "${file("install_jenkins.sh")}"
  key_name = "bugsquasherkey" # aws_key_pair.bugsquasherkey.key_name
  tags = {
    Name = "bugsquasher_jenkins_server"
  }

  depends_on = [
    aws_instance.jenkins_server
  ]
}







/*
data "aws_vpc" "default" {
  default = true
}

data "aws_availability_zones" "available" {}

resource "aws_default_subnet" "default_az1" {
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "Default subnet for us-east-1a"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow 8080 and 22 inbound traffic"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "ssh access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "http access"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}


variable "instance_type" {
  description = "Type of EC2 instance to provision"
  type        = string
  default     = "t2.medium"
}
*/