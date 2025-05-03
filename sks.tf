locals {
  zone = "at-vie-2"
}

resource "exoscale_sks_cluster" "my_sks_cluster" {
   zone = local.zone
   name = "my-sks-cluster"
   cni = "cilium"
}

resource "exoscale_sks_nodepool" "my_sks_nodepool" {
  zone       = local.zone
  cluster_id = exoscale_sks_cluster.my_sks_cluster.id
  name       = "my-sks-nodepool"
  instance_type = "standard.medium"
  size          = 3
  security_group_ids = [
    exoscale_security_group.my_security_group.id,
  ]
}
