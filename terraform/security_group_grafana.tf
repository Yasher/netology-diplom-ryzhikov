resource "yandex_vpc_security_group" "grafana_sg" {
  name        = "grafana_sg"
  description = "grafana"
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
        description    = "web3000"
        v4_cidr_blocks = ["0.0.0.0/0"]
        port           = 3000
    }

  egress {
    protocol       = "ANY"
    description    = "anywhere"
    v4_cidr_blocks = ["0.0.0.0/0"]
    from_port      = 0
    to_port        = 65535
  }

}