  
provider "aws" {
  region = var.aws-region
}

module "vpc" {
    source = "./vpc"
    
    bastion-host-ip  = module.ec2.ec2_global_ips
}

module "eks" {
    source = "./eks"

    eks-security-group-id           = module.vpc.security-group-id
    eks-allnodes-sg-id                = module.vpc.eks-allnodes-sg
    eks-subnet-id-1                 = module.vpc.subnet1-id
    eks-subnet-id-2                 = module.vpc.subnet2-id

}

module "ec2" {
    source = "./ec2"
    
    eks-vpc-id       = module.vpc.id
    eks-vpc-subnet-3 = module.vpc.subnet3-id
}