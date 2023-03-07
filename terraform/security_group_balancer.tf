resource "yandex_vpc_security_group" "balancer_sg" {
  name        = "balancer_sg"
  description = "balancer"
  network_id  = "${yandex_vpc_network.network-1.id}"

  labels = {
    my-label = "my-label-value"
  }

    ingress {
        protocol       = "TCP"
        description    = "healthcheck"
        predefined_target = "loadbalancer_healthchecks"
        port           = 30080
    }


    ingress {
    protocol       = "TCP"
    description    = "80"
    v4_cidr_blocks = ["0.0.0.0/0"]
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