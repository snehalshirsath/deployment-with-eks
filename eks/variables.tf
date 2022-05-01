
variable "eks-security-group-id" {}
variable "eks-subnet-id-1" {}
variable "eks-subnet-id-2" {}
variable "eks-allnodes-sg-id" {}

variable "eks-cluster-name" {
    default = "eks-cluster-attraqt"
}

variable "eks-cluster-role-name" {
    default = "eks-cluster-role-attraqt"
}

variable "eks-ng-name" {
  default = "eks-ng-attraqt"
}

variable "eks-node-ami" {
  default = "ami-0e472ba40eb589f49"
}

variable "eks-node-instance-type" {
  default = ["t3.medium"]
}