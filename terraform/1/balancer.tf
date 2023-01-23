resource "yandex_alb_target_group" "target1" {
  name           = "target1"

  target {
    subnet_id    = yandex_vpc_subnet.subnet-1.id
    ip_address   = yandex_compute_instance.vm-1.network_interface.0.ip_address
  }

  target {
    subnet_id    = yandex_vpc_subnet.subnet-2.id
    ip_address   = yandex_compute_instance.vm-2.network_interface.0.ip_address
  }

}


resource "yandex_alb_backend_group" "backend1" {
  name                     = "backend1"

  http_backend {
    name                   = "backend1"
    weight                 = 1
    port                   = 80
    target_group_ids       = [yandex_alb_target_group.target1.id]
    load_balancing_config {
      panic_threshold      = 90
    }    
    healthcheck {
      timeout              = "10s"
      interval             = "2s"
      healthy_threshold    = 10
      unhealthy_threshold  = 15 
      http_healthcheck {
        path               = "/"
      }
    }
  }
}

resource "yandex_alb_http_router" "router1" {
  name   = "router1"
  labels = {
    tf-label    = "tf-label-value"
    empty-label = ""
  }
}

resource "yandex_alb_virtual_host" "vhost1" {
  name           = "vhost1"
  http_router_id = yandex_alb_http_router.router1.id
  route {
    name = "route1"
    http_route {
      http_route_action {
        backend_group_id = yandex_alb_backend_group.backend1.id
        timeout          = "3s"
      }
    }
  }
}    



resource "yandex_alb_load_balancer" "balancer1" {
  name        = "balancer1"
  network_id  = yandex_vpc_network.network-1.id

  allocation_policy {
    location {
      zone_id   = "ru-central1-a"
      subnet_id = yandex_vpc_subnet.subnet-1.id
    }
    
    location {
      zone_id   = "ru-central1-b"
      subnet_id = yandex_vpc_subnet.subnet-2.id
    }
  }

  listener {
    name = "listener1"
    endpoint {
      address {
        external_ipv4_address {
        }
      }
      ports = [ 80 ]
    }
    http {
      handler {
        http_router_id = yandex_alb_http_router.router1.id
      }
    }
  }
}