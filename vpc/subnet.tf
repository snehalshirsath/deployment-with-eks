resource "aws_subnet" "eks-vpc-subnet-1" {
    vpc_id     = aws_vpc.eks-vpc-attraqt.id
    cidr_block = var.subnet-1-cidr-block
    availability_zone = var.eks-subnet-1-az

    tags {
        Name = var.subnet-1-tag-name
    }
}

resource "aws_subnet" "eks-vpc-subnet-2" {
    vpc_id     = aws_vpc.eks-vpc-attraqt.id
    cidr_block = var.subnet-2-cidr-block
    availability_zone = var.eks-subnet-2-az

    tags {
        Name = var.subnet-2-tag-name
    }
}

resource "aws_subnet" "eks-vpc-subnet-3" {
    vpc_id     = aws_vpc.eks-vpc-attraqt.id
    cidr_block = var.subnet-3-cidr-block
    availability_zone = var.eks-subnet-3-az

    tags {
        Name = var.subnet-3-tag-name
    }
}

output "subnet1-id" {
  value = aws_subnet.eks-vpc-subnet-1.id
}

output "subnet2-id" {
  value = aws_subnet.eks-vpc-subnet-2.id
}

output "subnet3-id" {
  value = aws_subnet.eks-vpc-subnet-3.id
}