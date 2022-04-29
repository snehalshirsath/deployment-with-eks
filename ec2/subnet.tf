#
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