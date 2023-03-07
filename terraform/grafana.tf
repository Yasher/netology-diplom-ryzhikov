
resource "yandex_compute_instance" "grafana" {
  name = "grafana"

  zone        = "ru-central1-c"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8cp9rjherlilnosipf"
      size = 10
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-3.id
    nat       = true
    security_group_ids = [yandex_vpc_security_group.grafana_sg.id]
  }

  metadata = {
    user-data = "${file("./meta.txt")}"
  }

}
#resource "yandex_vpc_network" "network-2" {
 # name = "network2"
#}

output "internal_ip_address_grafana" {
  value = yandex_compute_instance.grafana.network_interface.0.ip_address
}
output "external_ip_address_grafana" {
  value = yandex_compute_instance.grafana.network_interface.0.nat_ip_address
}
