
data "aws_eks_cluster_auth" "cluster_auth" {
  name = aws_eks_cluster.eks-cluster-attraqt.name
}

data "aws_eks_cluster" "eks-cluster-attraqt" {
  name = "eks-cluster-attraqt"
}

provider "kubernetes" {
  host                   = aws_eks_cluster.eks-cluster-attraqt.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks-cluster-attraqt.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.cluster_auth.token
}