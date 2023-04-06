variable "region" {
  default = "eu-west-2"
  description ="making region a variable"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
  description = "making vpc_cidr a variable"
}

variable "instance_tenancy" {
  default = "default"
  description = "making instance tenancy a variable"
}

variable "pub_sub1_cidr" {
  default = "10.0.5.0/24"
  description = "making public subnet1 cidr a variable"
}

variable "pub_sub2_cidr" {
  default = "10.0.6.0/24"
  description = "making public subnet2 cidr a variable"
}

variable "priv_sub1_cidr" {
  default = "10.0.7.0/24"
  description = "making private subnet1 cidr a variable"
}

variable "priv_sub2_cidr" {
  default = "10.0.8.0/24"
  description = "making private subnet2 cidr a variable"
}

variable "az1" {
  default = "eu-west-2a"
  description = "making availability zone1 a variable"
}

variable "az2" {
  default = "eu-west-2b"
  description = "making availability zone2 a variable"
}

variable "instance_type" {
  default = "t2.micro"
  description = "making instance type a variable"
}

variable "ami" {
  default = "ami-0a145236ee857b126"
  description = "making ami a variable"
}



