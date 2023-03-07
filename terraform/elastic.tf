
resource "yandex_compute_instance" "elastic" {
  name = "elastic"
  allow_stopping_for_update = "true"
  zone        = "ru-central1-b"

  resources {
    cores  = 4
    memory = 8
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
    security_group_ids = [yandex_vpc_security_group.elastic_sg.id]
  }

  
  metadata = {
    user-data = "${file("./meta.txt")}"
  }

}





output "internal_ip_address_elastic" {
  value = yandex_compute_instance.elastic.network_interface.0.ip_address
}
output "external_ip_address_elastic" {
  value = yandex_compute_instance.elastic.network_interface.0.nat_ip_address
}
