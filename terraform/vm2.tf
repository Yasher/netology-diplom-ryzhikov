
resource "yandex_compute_instance" "webserver2" {
  name = "webserver2"

  zone        = "ru-central1-b"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8jvcoeij6u9se84dt5"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-2.id
    nat       = true
    security_group_ids = [yandex_vpc_security_group.webservers_sg.id]
  }

  metadata = {
    user-data = "${file("./meta.txt")}"
  }

}
#resource "yandex_vpc_network" "network-2" {
 # name = "network2"
#}


output "internal_ip_address_webserver2" {
  value = yandex_compute_instance.webserver2.network_interface.0.ip_address
}
output "external_ip_address_webserver2" {
  value = yandex_compute_instance.webserver2.network_interface.0.nat_ip_address
}
