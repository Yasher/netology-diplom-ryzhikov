
resource "yandex_compute_instance" "vm-4" {
  name = "grafana"

  zone        = "ru-central1-c"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8cp9rjherlilnosipf"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-3.id
    nat       = true
  }

  metadata = {
    user-data = "${file("./meta.txt")}"
  }

}
#resource "yandex_vpc_network" "network-2" {
 # name = "network2"
#}

output "internal_ip_address_grafana" {
  value = yandex_compute_instance.vm-4.network_interface.0.ip_address
}
output "external_ip_address_grafana" {
  value = yandex_compute_instance.vm-4.network_interface.0.nat_ip_address
}
