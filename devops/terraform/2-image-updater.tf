resource "helm_release" "updater" {
  name = "updater"
  namespace        = "argocd"
  create_namespace = true

  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argocd-image-updater"
  version          = "0.11.3"

  values = [file("values/image-updater.yaml")]
}