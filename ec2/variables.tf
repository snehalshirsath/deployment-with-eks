

variable "eks-vpc-id" {}


variable "image-id" {
    description = "image id for instance"
    default = "ami-003f91f482a604b6d"
}

variable "instance-type" {
    description = "instance type for autoscaling group"
    default = "t2.medium"
}

variable "availability-zone" {
    default = "eu-west-1c"
}

variable "bastion-ec2-instance" {
    default = "eks-bastion-EC2-instance"
}

variable "ec2-instance-key-name" {
    default = "attraqt-snehal-aws-key"
}

variable "bastion-host-sg-name" {
    default = "eks-bastion-host-sg"
}

variable "subnet-3-cidr-block" {
    default = "172.31.16.0/20"
}

variable "subnet-3-tag-name" {
    default = "eks-vpc-subnet-3-attraqt"
}

variable "eks-subnet-3-az" {
    default = "eu-west-1c"
}