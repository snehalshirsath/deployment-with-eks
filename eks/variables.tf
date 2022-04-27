
variable "eks-security-group-id" {}
variable "eks-subnet-id-1" {}
variable "eks-subnet-id-2" {}

variable "eks-cluster-name" {
    default = "eks-cluster-attraqt"
}

variable "eks-cluster-role-name" {
    default = "eks-cluster-role-attraqt"
}
