
# EKS Cluster Resources
#  * IAM Role to allow EKS service to manage other AWS services
#  * EC2 Security Group to allow networking traffic with EKS cluster
#  * EKS Cluster
#  

resource "aws_iam_openid_connect_provider" "eks-iam-connect-provider" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.example.certificates[0].sha1_fingerprint]
  url             = aws_eks_cluster.eks-cluster-attraqt.identity[0].oidc[0].issuer
}

data "aws_iam_policy_document" "eks-attraqt-assume-role-policy" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    condition {
      test     = "StringEquals"
      variable = "${replace(aws_iam_openid_connect_provider.eks-iam-connect-provider.url, "https://", "")}:sub"
      values   = ["system:serviceaccount:kube-system:aws-node"]
    }
    principals {
      identifiers = [aws_iam_openid_connect_provider.eks-iam-connect-provider.arn]
      type        = "Federated"
    }
  }
}

resource "aws_iam_role" "eks-service-iam" {
  assume_role_policy = data.aws_iam_policy_document.eks-attraqt-assume-role-policy.json
  name               = "eks-iam-service-account-role"
}

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
    endpoint_private_access = "true"
    endpoint_public_access  = "false"
    security_group_ids = [var.eks-security-group-id, var.eks-allnodes-sg-id]
    subnet_ids         = [var.eks-subnet-id-1, var.eks-subnet-id-2]
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks-attraqt-cluster-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.eks-attraqt-cluster-AmazonEKSVPCResourceController,
  ]
}


resource "kubernetes_config_map" "aws_auth_configmap" {
  metadata {
    name      = "aws-auth"
    namespace = "kube-system"
  }
  data = {
    mapRoles = <<YAML
- rolearn: ${aws_iam_role.eks-attraqt-node.arn}
  username: system:node:{{EC2PrivateDNSName}}
  groups:
    - system:bootstrappers
    - system:nodes
- rolearn: ${aws_iam_role.eks-attraqt-cluster.arn}
  username: kubectl-access-user
  groups:
    - system:masters
YAML
  }
}

output "eks-cluster-endpoint" {
  value = aws_eks_cluster.eks-cluster-attraqt.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.eks-cluster-attraqt.certificate_authority[0].data
}

output "attraqt-eks-cluster-name" {
  value= aws_eks_cluster.eks-cluster-attraqt.name
}