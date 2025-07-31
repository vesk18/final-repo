module "argocd" {
  source = "./modules/eks-external-dns"

  argo_spec = {
    source = {
      repoURL        = "https://kubernetes-sigs.github.io/external-dns"
      targetRevision = "1.14.4"
      chart          = "external-dns"
      helm = {
        parameters = [
          {
            name        = "provider"
            value       = "aws"
            forceString = false
          },
          {
            name        = "registry"
            value       = "txt"
            forceString = false
          },
          {
            name        = "txtOwnerId"
            value       = "vesk18"
            forceString = false
          },
          {
            name        = "domainFilters[0]"
            value       = "vesk18.devops7.test-danit.com"
            forceString = false
          }
        ]
      }
    }
    destination = {
      server    = "https://kubernetes.default.svc"
      namespace = "default"
    }
    project = "default"
    syncPolicy = {
      automated = {
        prune      = true
        selfHeal   = true
      }
    }
  }

  cluster_identity_oidc_issuer     = aws_eks_cluster.vesk18.identity[0].oidc[0].issuer
  cluster_identity_oidc_issuer_arn = aws_iam_openid_connect_provider.openid_connect.arn

  irsa_role_name_prefix     = "vesk18-external-dns"
  policy_allowed_zone_ids   = ["Z02537122N3YB2GRT9YY1"]

settings = {
  provider      = "\"aws\""
  domainFilters = "[\\\"vesk18.devops7.test-danit.com\\\"]"
  txtOwnerId    = "\"vesk18\""
  registry      = "\"txt\""
}

  namespace         = "argocd"
  enabled           = true
  argo_enabled      = true
  argo_helm_enabled = true

  providers = {
    helm       = helm
    kubernetes = kubernetes
  }
}
