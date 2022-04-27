
# EKS Cluster Resources
#  * IAM Role to allow EKS service to manage other AWS services
#  * EC2 Security Group to allow networking traffic with EKS cluster
#  * EKS Cluster
#

resource "aws_iam_role" "eks-attraqt-cluster" {
  name = var.eks-cluster-role-name

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "eks-attraqt-cluster-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks-attraqt-cluster.name
}

resource "aws_iam_role_policy_attachment" "eks-attraqt-cluster-AmazonEKSVPCResourceController" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.eks-attraqt-cluster.name
}

resource "aws_eks_cluster" "eks-cluster-attraqt" {
  name     = var.eks-cluster-name
  role_arn = aws_iam_role.eks-attraqt-cluster.arn

  vpc_config {
    security_group_ids = [var.eks-security-group-id]
    subnet_ids         = [var.eks-subnet-id-1, var.eks-subnet-id-2]
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks-attraqt-cluster-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.eks-attraqt-cluster-AmazonEKSVPCResourceController,
  ]
}