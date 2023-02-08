terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token     = "y0_AgAAAABWsG19AATuwQAAAADX42js8tLZWSu_SB2WAvXZFeDnocSryXk"
  cloud_id  = "b1gfvdpsmg19e92jen9i"
  folder_id = "b1g6a545g5vdkit1j78m"
 # zone      = "ru-central1-a"
}





resource "yandex_vpc_subnet" "subnet-1" {
    name           = "subnet1"
    zone           = "ru-central1-a"
    network_id     = yandex_vpc_network.network-1.id
    v4_cidr_blocks = ["192.168.10.0/24"]
  }

 resource "yandex_vpc_subnet" "subnet-2" {
    name           = "subnet2"
    zone           = "ru-central1-b"
    network_id     = yandex_vpc_network.network-1.id
    v4_cidr_blocks = ["192.168.20.0/24"]
  } 

  resource "yandex_vpc_subnet" "subnet-3" {
  name           = "subnet3"
  zone           = "ru-central1-c"
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["192.168.30.0/24"]
}