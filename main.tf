resource "exoscale_security_group" "my_security_group" {
  name = "my-sks-cluster-sg"
}

resource "exoscale_security_group_rule" "kubelet" {
  security_group_id = exoscale_security_group.my_security_group.id
  description       = "Kubelet"
  type              = "INGRESS"
  protocol          = "TCP"
  start_port        = 10250
  end_port          = 10250
  # (beetwen worker nodes only)
  user_security_group_id = exoscale_security_group.my_security_group.id
}

resource "exoscale_security_group_rule" "cilium_vxlan" {
  security_group_id = exoscale_security_group.my_security_group.id
  description       = "Cilium VXLAN"
  type              = "INGRESS"
  protocol          = "UDP"
  start_port        = 8472
  end_port          = 8472
  user_security_group_id = exoscale_security_group.my_security_group.id
}

resource "exoscale_security_group_rule" "cilium_health" {
  security_group_id = exoscale_security_group.my_security_group.id
  description       = "Cilium Health Check"
  type              = "INGRESS"
  protocol          = "ICMP"
  icmp_code         = 0
  icmp_type         = 8
  user_security_group_id = exoscale_security_group.my_security_group.id
}

resource "exoscale_security_group_rule" "cilium_health_tcp" {
  security_group_id = exoscale_security_group.my_security_group.id
  description       = "Cilium Health Check"
  type              = "INGRESS"
  protocol          = "TCP"
  start_port        = 4240
  end_port          = 4240
  user_security_group_id = exoscale_security_group.my_security_group.id
}
