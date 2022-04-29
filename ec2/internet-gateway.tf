resource "aws_internet_gateway" "bastion-host-internet-gateway" {
  vpc_id = var.eks-vpc-id
}
