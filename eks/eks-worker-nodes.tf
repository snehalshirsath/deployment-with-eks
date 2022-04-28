#
# EKS Worker Nodes Resources
#  * IAM role allowing Kubernetes actions to access other AWS services
#  * EKS Node Group to launch worker nodes
#

resource "aws_iam_role" "eks-attraqt-node" {
  name = "terraform-eks-attraqt-node"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
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

resource "aws_eks_node_group" "eks-ng-attraqt" {
  cluster_name    = aws_eks_cluster.eks-cluster-attraqt.name
  node_group_name = var.eks-ng-name
  node_role_arn   = aws_iam_role.eks-attraqt-node.arn
  subnet_ids      = [var.eks-subnet-id-1, var.eks-subnet-id-2]
  instance_types  = var.eks-node-instance-type

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks-attraqt-node-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eks-attraqt-node-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.eks-attraqt-node-AmazonEC2ContainerRegistryReadOnly,
  ]
}
