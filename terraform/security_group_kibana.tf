resource "yandex_vpc_security_group" "kibana_sg" {
  name        = "kibana_sg"
  description = "kibana"
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
        description    = "web5601"
        v4_cidr_blocks = ["0.0.0.0/0"]
        port           = 5601
    }

  egress {
    protocol       = "ANY"
    description    = "anywhere"
    v4_cidr_blocks = ["0.0.0.0/0"]
    from_port      = 0
    to_port        = 65535
  }

}