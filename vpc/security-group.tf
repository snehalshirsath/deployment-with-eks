
resource "aws_security_group" "eks-vpc-security-group" {
  name        = var.eks-cluster-sg-name
  description = "Cluster communication with worker nodes"
  vpc_id      = aws_vpc.eks-vpc-attraqt.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.eks-sg-cidr-blocks]

  }

  tags = {
    Name = var.eks-cluster-sg-name
  }
}

resource "aws_security_group_rule" "attraqt-cluster-ingress-workstation-https" {
  cidr_blocks       = [var.bastion-host-ip]
  description       = "Allow workstation to communicate with the cluster API Server"
  from_port         = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.eks-vpc-security-group.id
  to_port           = 443
  type              = "ingress"
}


output "security-group-id" {
  value = aws_security_group.eks-vpc-security-group.id
}