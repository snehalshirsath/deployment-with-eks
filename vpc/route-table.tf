
resource "aws_route_table" "priv-subnet-1-rtb" {
  propagating_vgws = []
  route            = []
  tags             = {}
  vpc_id           = aws_vpc.eks-vpc-attraqt.id
}

resource "aws_route_table_association" "priv-subnet-1-rtbassoc" {
  route_table_id = aws_route_table.priv-subnet-1-rtb.id
  subnet_id      = aws_subnet.eks-vpc-subnet-1.id
}


output "rtb-priv1" {
  value = aws_route_table.priv-subnet-1-rtb.id
}

resource "aws_route_table" "priv-subnet-2-rtb" {
  propagating_vgws = []
  route            = []
  tags             = {}
  vpc_id           = aws_vpc.eks-vpc-attraqt.id
}

resource "aws_route_table_association" "priv-subnet-2-rtbassoc" {
  route_table_id = aws_route_table.priv-subnet-2-rtb.id
  subnet_id      = aws_subnet.eks-vpc-subnet-2.id
}


output "rtb-priv2" {
  value = aws_route_table.priv-subnet-2-rtb.id
}

resource "aws_route_table" "bastion-host-ig-rt" {
  vpc_id = aws_vpc.eks-vpc-attraqt.id

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

