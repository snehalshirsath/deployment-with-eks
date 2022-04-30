  
provider "aws" {
  region = var.aws-region
}

module "vpc" {
    source = "./vpc"
}

module "eks" {
    source = "./eks"

    eks-security-group-id      = module.vpc.security-group-id
    eks-allnodes-sg-id         = module.vpc.eks-allnodes-sg
    eks-subnet-id-1            = module.vpc.subnet1-id
    eks-subnet-id-2            = module.vpc.subnet2-id
    eks-cluster-endpoint       = module.eks.eks-cluster-endpoint
    attreaqt-eks-cluster-name  = module.eks.attreaqt-eks-cluster-name

}

#module "ec2" {
#  source = "./ec2"
  
#  bastion-host-security-group = module.vpc.bastion-security-group-id
#  bastion-host-subnet-id      = module.vpc.subnet3-id
#  eks-vpc-id                  = module.vpc.id
#}