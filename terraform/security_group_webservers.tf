resource "yandex_vpc_security_group" "webservers_sg" {
  name        = "webservers_sg"
  description = "webservers"
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
        description    = "prometheus9100"
        security_group_id = yandex_vpc_security_group.prometheus_sg.id
        port           = 9100
    }

    ingress {
    protocol       = "TCP"
    description    = "80"
    v4_cidr_blocks = [yandex_vpc_subnet.subnet-1.v4_cidr_blocks.0, yandex_vpc_subnet.subnet-2.v4_cidr_blocks.0]
    #security_group_id = yandex_vpc_security_group.bastion111.id
    port           = 80
  }

  egress {
    protocol       = "ANY"
    description    = "anywhere"
    v4_cidr_blocks = ["0.0.0.0/0"]
    from_port      = 0
    to_port        = 65535
  }

}