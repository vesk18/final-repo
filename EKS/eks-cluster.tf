resource "aws_eks_cluster" "vesk18" {
  name     = "vesk18"
  role_arn = aws_iam_role.cluster.arn

  vpc_config {
    security_group_ids = [aws_security_group.danit-cluster.id]
    subnet_ids         = var.subnets_ids
  }

  depends_on = [
    aws_iam_role_policy_attachment.kubeedge-cluster-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.kubeedge-cluster-AmazonEKSVPCResourceController,
  ]
  tags = merge(
    var.tags,
    { Name = "${var.name}" }
  )
}

data "aws_eks_cluster_auth" "vesk18" {
  name = aws_eks_cluster.vesk18.name
}

resource "aws_eks_addon" "coredns" {
  cluster_name                = "vesk18"
  addon_name                  = "coredns"
  #addon_version               = "v1.11.1-eksbuild.4"
  #addon_version		      = "v1.11.3-eksbuild.1"
  addon_version               = "v1.12.2-eksbuild.4"
  resolve_conflicts_on_create = "OVERWRITE"

  depends_on = [aws_eks_node_group.danit-amd]
}
