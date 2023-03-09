
resource "yandex_compute_instance" "vmet" {
  name = "elast-test"

  zone        = "ru-central1-a"

  resources {
    cores  = 4
    memory = 8
    #core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = "fd8jvcoeij6u9se84dt5"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    user-data = "${file("./meta.txt")}"
  }

}


output "internal_ip_address_vm_et_test" {
  value = yandex_compute_instance.vmet.network_interface.0.ip_address
}
output "external_ip_address_vm_et_test" {
  value = yandex_compute_instance.vmet.network_interface.0.nat_ip_address
}
