terraform {
  required_providers {
    exoscale = {
      source  = "exoscale/exoscale"
      version = "0.54.1"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.12.1"
    }
  }
}

provider "helm" {
  kubernetes {
    config_path = "kubeconfig"
  }
}

provider "exoscale" {
key = "EXOc99b18cb0d0d72d96abe8db9"
  secret = "7hnQlFIU7ZVKJoZHBUS8BOzVF6kjvtR9DWKp103_ZQc"
}
