
resource "aws_vpc" "eks-vpc-attraqt" {
  cidr_block = var.vpc-cidr-block
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  
  tags = {
    Name = var.eks-vpc-name
  }
}

resource "aws_nat_gateway" "eks-nat-subnet1" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.eks-vpc-subnet-1.id
  
}

resource "aws_nat_gateway" "eks-nat-subnet2" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.eks-vpc-subnet-2.id
}

output "id" {
  value = aws_vpc.eks-vpc-attraqt.id
  }
