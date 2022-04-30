
data "aws_eks_cluster_auth" "cluster_auth" {
  name = var.attraqt-eks-cluster-name
}

provider "kubernetes" {
  host                   = var.eks-cluster-endpoint
  cluster_ca_certificate = base64decode(var.attraqt-eks-cluster-name.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster_auth.token
  load_config_file       = false
}