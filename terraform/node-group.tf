resource "aws_eks_node_group" "wanderpeak" {
  cluster_name    = aws_eks_cluster.wanderpeak.name
  node_group_name = "wanderpeak-node-group"

  node_role_arn = aws_iam_role.eks_node.arn

  subnet_ids = [
    aws_subnet.private_a.id,
    aws_subnet.private_b.id
  ]

  instance_types = ["t3.small"]

  scaling_config {
    desired_size = 2
    min_size     = 1
    max_size     = 2
  }

  tags = {
    Name = "wanderpeak-node-group"
  }
}