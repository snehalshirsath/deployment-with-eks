#
# EKS Worker Nodes Resources
#  * IAM role allowing Kubernetes actions to access other AWS services
#  * EKS Node Group to launch worker nodes
#

resource "aws_iam_role" "eks-attraqt-node" {
  name = "eks-attraqt-node-iam-role"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

output "eks-cluster-arn" {
  value = aws_iam_role.eks-attraqt-node.arn
}

resource "aws_iam_role_policy_attachment" "eks-attraqt-node-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.eks-attraqt-node.name
}

resource "aws_iam_role_policy_attachment" "eks-attraqt-node-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.eks-attraqt-node.name
}

resource "aws_iam_role_policy_attachment" "eks-attraqt-node-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.eks-attraqt-node.name
}

resource "aws_iam_role_policy_attachment" "eks-attraqt-node-AmazonEC2ContainerRegistryFullAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
  role       = aws_iam_role.eks-attraqt-node.name
}


resource "aws_eks_node_group" "eks-ng-attraqt" {
  cluster_name    = aws_eks_cluster.eks-cluster-attraqt.name
  node_group_name = var.eks-ng-name
  node_role_arn   = aws_iam_role.eks-attraqt-node.arn
  subnet_ids      = [var.eks-subnet-id-1, var.eks-subnet-id-2]
  instance_types  = var.eks-node-instance-type

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 2
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks-attraqt-node-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eks-attraqt-node-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.eks-attraqt-node-AmazonEC2ContainerRegistryReadOnly,
    aws_iam_role_policy_attachment.eks-attraqt-node-AmazonEC2ContainerRegistryFullAccess,
  ]
}



