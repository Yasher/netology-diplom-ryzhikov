
resource "yandex_compute_instance" "vm-3" {
  name = "prometeus"

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

resource "yandex_vpc_subnet" "subnet-3" {
  name           = "subnet3"
  zone           = "ru-central1-c"
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["192.168.20.0/24"]
}

output "internal_ip_address_promet" {
  value = yandex_compute_instance.vm-3.network_interface.0.ip_address
}
output "external_ip_address_promet" {
  value = yandex_compute_instance.vm-3.network_interface.0.nat_ip_address
}
