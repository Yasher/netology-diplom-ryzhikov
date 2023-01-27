
resource "yandex_compute_instance" "vm-6" {
  name = "elastic"
  allow_stopping_for_update = "true"
  zone        = "ru-central1-b"

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd82vol772l2nq9p12pb"  #deb 10
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

resource "yandex_vpc_subnet" "subnet-2" {
    name           = "subnet2"
    zone           = "ru-central1-b"
    network_id     = yandex_vpc_network.network-1.id
    v4_cidr_blocks = ["192.168.30.0/24"]
  }

#resource "yandex_vpc_network" "network-2" {
 # name = "network2"
#}

output "internal_ip_address_elastic" {
  value = yandex_compute_instance.vm-6.network_interface.0.ip_address
}
output "external_ip_address_elastic" {
  value = yandex_compute_instance.vm-6.network_interface.0.nat_ip_address
}
