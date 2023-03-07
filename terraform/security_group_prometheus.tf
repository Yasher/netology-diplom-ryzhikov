resource "yandex_vpc_security_group" "prometheus_sg" {
  name        = "prometheus_sg"
  description = "prometheus"
  network_id  = "${yandex_vpc_network.network-1.id}"

  labels = {
    my-label = "my-label-value"
  }

  ingress {
    protocol       = "TCP"
    description    = "ssh"
    v4_cidr_blocks = ["0.0.0.0/0"]
    #security_group_id = yandex_vpc_security_group.bastion111.id
    port           = 22
  }

    ingress {
        protocol       = "TCP"
        description    = "grafana9090"
        security_group_id = yandex_vpc_security_group.grafana_sg.id
        port           = 9090
    }

  egress {
    protocol       = "ANY"
    description    = "anywhere"
    v4_cidr_blocks = ["0.0.0.0/0"]
    from_port      = 0
    to_port        = 65535
  }

}