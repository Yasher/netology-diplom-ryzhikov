data "yandex_compute_instance" "disk_id_elast_test" {    
name = "elast-test"
#folder_id = "b1g6a545g5vdkit1j78m"
}


output "disk_list" {
  value = data.yandex_compute_instance.disk_id_elast_test.boot_disk.0.disk_id
}

# output "disk_list1" {
#   value = [
#   for vm in data.yandex_compute_instance.disks :
#    "${vm.boot_disk.disk_id}"
#   ]
# }