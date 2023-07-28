variable "AWS_REGION" {
  default = "us-east-1"
}

variable "MYIP" {
  default = "73.110.238.26/32"
}

variable "PUB_KEY_PATH" {
  default = "bugsquasherskey.pub"
}

variable "PRIV_KEY_PATH" {
  default = "bugsquasherkey"
}

variable "Name_tag" {
  default = "bastion-host-key"
}


variable "instance_count" {
  default = "1"
}

variable "VPC_NAME" {
  default = "bugsquashers-VPC"
}

variable "Zone1" {
  default = "us-east-1a"
}

variable "Zone2" {
  default = "us-east-1b"
}


variable "VpcCIDR" {
  description = "The CIDR block for the VPC"
  default = "172.0.0.0/16"
}


variable "PubSub1CIDR" {
  description = "The CIDR block for Public Subnet"
  default = "172.0.1.0/24"
}

variable "PrivSub1CIDR" {
  description = "The CIDR block for Private Subnet 1"
  default = "172.0.2.0/24"
}

variable "PrivSub2CIDR" {
  description = "The CIDR block for Private Subnet 2"
  default = "172.0.3.0/24"
}

variable "instance_type" {
  description = "Type of EC2 instance to provision"
  type        = string
  default     = "t2.medium"
}

