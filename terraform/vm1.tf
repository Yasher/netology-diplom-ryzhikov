
resource "yandex_compute_instance" "webserver1" {
  name = "webserver1"

  zone        = "ru-central1-a"

  resources {
    cores  = 2
    memory = 2
                #core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = "fd8jvcoeij6u9se84dt5"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = false
  }

  metadata = {
    user-data = "${file("./meta.txt")}"
  }

}
resource "yandex_vpc_network" "network-1" {
  name = "network1"
}

output "internal_ip_address_webserver1" {
  value = yandex_compute_instance.webserver1.network_interface.0.ip_address
}
output "external_ip_address_webserver1" {
  value = yandex_compute_instance.webserver1.network_interface.0.nat_ip_address
}
