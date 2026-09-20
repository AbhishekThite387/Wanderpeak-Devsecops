resource "aws_eks_cluster" "wanderpeak" {
  name     = "wanderpeak-cluster"
  role_arn = aws_iam_role.eks_cluster.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.private_a.id,
      aws_subnet.private_b.id
    ]
  }

  tags = {
    Name = "wanderpeak-cluster"
  }
}

resource "aws_eks_addon" "pod_identity_agent" {
  cluster_name = aws_eks_cluster.wanderpeak.name
  addon_name   = "eks-pod-identity-agent"
}