resource "aws_subnet" "eks-vpc-subnet-1" {
    vpc_id     = aws_vpc.eks-vpc-attraqt.id
    cidr_block = var.subnet-1-cidr-block
    availability_zone = var.eks-subnet-1-az
    map_public_ip_on_launch         = false

    tags = tomap({
        "Name" = "${var.subnet-1-tag-name}",
        "kubernetes.io/cluster/${var.eks-cluster-name}" = "shared",
    })
}

resource "aws_subnet" "eks-vpc-subnet-2" {
    vpc_id     = aws_vpc.eks-vpc-attraqt.id
    cidr_block = var.subnet-2-cidr-block
    availability_zone = var.eks-subnet-2-az
    map_public_ip_on_launch         = false

    tags = tomap({
        "Name" = "${var.subnet-2-tag-name}",
        "kubernetes.io/cluster/${var.eks-cluster-name}" = "shared",
    })
}

# subnet for bastion instance
#

resource "aws_subnet" "eks-vpc-subnet-3" {
    vpc_id     = var.eks-vpc-id
    cidr_block = var.subnet-3-cidr-block
    availability_zone = var.eks-subnet-3-az
    map_public_ip_on_launch = true

    tags = {
        "Name" = var.subnet-3-tag-name
    }
}


output "subnet3-id" {
  value = aws_subnet.eks-vpc-subnet-3.id
}

output "subnet1-id" {
  value = aws_subnet.eks-vpc-subnet-1.id
}

output "subnet2-id" {
  value = aws_subnet.eks-vpc-subnet-2.id
}
