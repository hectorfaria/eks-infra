resource "helm_release" "argocd" {
  name             = "argocd"
  chart            = "argo-cd"
  repository       = "https://argoproj.github.io/argo-helm"
  version          = "5.51.6"
  namespace        = "argocd"
  create_namespace = true

  values = [
    file("${path.module}/templates/argocd-values.yaml")
  ]

  depends_on = [aws_eks_node_group.general]
}


resource "helm_release" "metrics_server" {
  name       = "metrics-server"
  chart      = "metrics-server"
  repository = "https://kubernetes-sigs.github.io/metrics-server/"
  namespace  = "kube-system"
  version    = "3.12.1"

  values = [file("${path.module}/templates/metrics-server.yaml")]

  depends_on = [aws_eks_node_group.general]
}