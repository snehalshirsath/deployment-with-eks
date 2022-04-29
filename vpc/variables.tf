
#variable "bastion-host-sg-id" {}

variable "eks-cluster-name" {
    default = "eks-cluster-attraqt"
}

variable "eks-vpc-name" {
    default = "eks-vpc-attraqt"
}

variable "vpc-cidr-block" {
    default = "172.31.0.0/16"
}

variable "subnet-1-cidr-block" {
    default = "172.31.32.0/20"
}

variable "subnet-1-tag-name" {
    default = "eks-vpc-privsubnet-1-attraqt"
}

variable "eks-subnet-1-az" {
    default = "eu-west-1a"
}

variable "subnet-2-cidr-block" {
    default = "172.31.0.0/20"
}

variable "subnet-2-tag-name" {
    default = "eks-vpc-privsubnet-2-attraqt"
}

variable "eks-subnet-2-az" {
    default = "eu-west-1b"
}

variable "eks-cluster-sg-name" {
    default = "eks-cluster-sg-attraqt"
}

variable "eks-sg-cidr-blocks" {
    default = ["0.0.0.0/0"]
}