
variable "bastion-host-ip" {}

variable "eks-vpc-name" {
    default = "eks-vpc-attraqt"
}

variable "vpc-cidr-block" {
    default = "10.0.0.0/16"
}

variable "subnet-1-cidr-block" {
    default = "10.0.0.0/20"
}

variable "subnet-1-tag-name" {
    default = "eks-vpc-subnet-1-attraqt"
}

variable "eks-subnet-1-az" {
    default = "eu-west-1a"
}

variable "subnet-2-cidr-block" {
    default = "10.0.1.0/20"
}

variable "subnet-2-tag-name" {
    default = "eks-vpc-subnet-2-attraqt"
}

variable "eks-subnet-2-az" {
    default = "eu-west-1b"
}

variable "subnet-3-cidr-block" {
    default = "10.0.2.0/20"
}

variable "subnet-3-tag-name" {
    default = "eks-vpc-subnet-3-attraqt"
}

variable "eks-subnet-3-az" {
    default = "eu-west-1c"
}

variable "eks-cluster-sg-name" {
    default = "eks-cluster-sg-attraqt"
}

variable "eks-sg-cidr-blocks" {
    default = "["0.0.0.0/0"]"
}