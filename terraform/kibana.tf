
resource "yandex_compute_instance" "vm-7" {
  name = "kibana"

  zone        = "ru-central1-b"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd82vol772l2nq9p12pb" #deb 10
      size = 10
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-2.id
    nat       = true
  }

  
  metadata = {
    user-data = "${file("./meta.txt")}"
  }

}

#resource "yandex_vpc_network" "network-2" {
 # name = "network2"
#}

output "internal_ip_address_kibana" {
  value = yandex_compute_instance.vm-7.network_interface.0.ip_address
}
output "external_ip_address_kibana" {
  value = yandex_compute_instance.vm-7.network_interface.0.nat_ip_address
}
