#
# route table for bastion host and its association
#

resource "aws_route_table" "bastion-host-ig-rt" {
  vpc_id = var.eks-vpc-id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.bastion-host-internet-gateway.id
  }
}

resource "aws_route_table_association" "bastion-host-route-table-association" {
  subnet_id      = aws_subnet.eks-vpc-subnet-3.id
  route_table_id = aws_route_table.bastion-host-ig-rt.id
}

output "rtb-pub1" {
  value = aws_route_table.bastion-host-ig-rt.id
}