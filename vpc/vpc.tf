
resource "aws_vpc" "eks-vpc-attraqt" {
  cidr_block = var.vpc-cidr-block
  enable_dns_hostnames = "true"
  
  tags = {
    Name = var.eks-vpc-name
  }
}

output "id" {
  value = aws_vpc.eks-vpc-attraqt.id
  }
