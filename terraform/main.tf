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