# создание группы
resource "yandex_lb_target_group" "reddit_target_group" {
  name      = "reddit-lb-group"
  folder_id = var.folder_id

  dynamic "target" {
    for_each = [for app in yandex_compute_instance.app : {
      address   = app.network_interface.0.ip_address
      subnet_id = app.network_interface.0.subnet_id
    }]
    content {
      subnet_id = target.value.subnet_id
      address   = target.value.address
    }
  }
}

resource "yandex_lb_network_load_balancer" "yande-lb" {
  name = "my-network-load-balancer"

  listener {
    name = "my-listener"
    port = 9292
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.reddit_target_group.id

    healthcheck {
      name = "http"
      http_options {
        port = 9292
        path = "/"
      }
    }
  }
}
