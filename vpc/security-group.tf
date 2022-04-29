
resource "aws_security_group" "eks-vpc-security-group" {
  name        = var.eks-cluster-sg-name
  description = "Cluster communication with worker nodes"
  vpc_id      = aws_vpc.eks-vpc-attraqt.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.eks-sg-cidr-blocks

  }

  tags = {
    Name = var.eks-cluster-sg-name
  }
}

resource "aws_security_group_rule" "attraqt-cluster-ingress-workstation-https" {
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Allow workstation to communicate with the cluster API Server"
  from_port         = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.eks-vpc-security-group.id
  to_port           = 443
  type              = "ingress"
}

resource "aws_security_group" "eks-allnodes-sg" {
  description = "Communication between all nodes in the cluster"
  vpc_id      = aws_vpc.eks-vpc-attraqt.id
  tags = {
    "Name"   = format("eks-%s-cluster/ClusterSharedNodeSecurityGroup",var.eks-cluster-name)
    "Label"  = "TF-EKS All Nodes Comms"
  }
}


resource "aws_security_group" "bastion-ec2-instance-security-group" {
    name        = var.bastion-host-sg-name
    description = "Allow HTTP, HTTPS, and SSH"
    vpc_id = var.eks-vpc-id

    // HTTP
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    // HTTPS
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    // SSH
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

output "security-group-id" {
  value = aws_security_group.bastion-ec2-instance-security-group.id
}

output "eks-allnodes-sg" {
  value = aws_security_group.eks-allnodes-sg.id
}

output "security-group-id" {
  value = aws_security_group.eks-vpc-security-group.id
}