resource "aws_internet_gateway" "bastion-host-internet-gateway" {
  vpc_id = aws_vpc.eks-vpc-attraqt.id
}
