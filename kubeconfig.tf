# (administration credentials)
resource "exoscale_sks_kubeconfig" "my_sks_kubeconfig" {
  zone       = local.zone
  cluster_id = exoscale_sks_cluster.my_sks_cluster.id
  user   = "kubernetes-admin"
  groups = ["system:masters"]
  ttl_seconds           = 3600
  early_renewal_seconds = 300
}
resource "local_sensitive_file" "my_sks_kubeconfig_file" {
  filename        = "kubeconfig"
  content         = exoscale_sks_kubeconfig.my_sks_kubeconfig.kubeconfig
  file_permission = "0600"
}
