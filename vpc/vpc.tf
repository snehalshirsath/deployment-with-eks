
resource "aws_vpc" "eks-vpc-attraqt" {
  cidr_block = var.vpc-cidr-block
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  
  tags = {
    Name = var.eks-vpc-name
  }
}

resource "aws_nat_gateway" "eks-nat-subnet1" {
  connectivity_type = "public"
  subnet_id         = aws_subnet.eks-vpc-subnet-4.id
  
  depends_on = [aws_internet_gateway.bastion-host-internet-gateway]
}

output "id" {
  value = aws_vpc.eks-vpc-attraqt.id
  }
