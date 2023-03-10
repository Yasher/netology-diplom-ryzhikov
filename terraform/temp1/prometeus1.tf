
resource "yandex_compute_instance" "vm-5" {
  name = "prometeus1"

  zone        = "ru-central1-c"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8mj0q8vkpvbpk9d0a0"
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

output "internal_ip_address_promet1" {
  value = yandex_compute_instance.vm-5.network_interface.0.ip_address
}
output "external_ip_address_promet1" {
  value = yandex_compute_instance.vm-5.network_interface.0.nat_ip_address
}
