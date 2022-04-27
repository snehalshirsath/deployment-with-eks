
variable "eks-vpc-subnet-3" {} 
variable "eks-vpc-id" {}


variable "image-id" {
    description = "image id for instance"
    default = "ami-d61027ad"
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
    default = "eks-bastion-host-sg
}