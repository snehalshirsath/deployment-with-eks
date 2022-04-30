
variable "aws-region" {
    description = "The name for region."
    default = "eu-west-1"
}

variable "eks-cluster-endpoint" {
    default = module.eks.eks-cluster-endpoint
}

variable "attraqt-eks-cluster-name" {
    default = module.eks.attraqt-eks-cluster-name
}