
resource "yandex_compute_instance" "vmtest" {
  name = "terraform1-test"

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
    nat       = true
  }

  metadata = {
    user-data = "${file("./meta.txt")}"
  }

}


output "internal_ip_address_vm_1_test" {
  value = yandex_compute_instance.vmtest.network_interface.0.ip_address
}
output "external_ip_address_vm_1_test" {
  value = yandex_compute_instance.vmtest.network_interface.0.nat_ip_address
}
