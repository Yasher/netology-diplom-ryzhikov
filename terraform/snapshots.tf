resource "yandex_compute_snapshot_schedule" "default" {
  name           = "myschedule"

  schedule_policy {
    expression = "0 2 * * *"
  }

  snapshot_count = 7

  snapshot_spec {
      description = "Мое описание расписания спнапшотов"
      labels = {
        snapshot-label = "my-snapshot-label-value"
      }
  }

  labels = {
    my-label = "my-label-value"
  }

  disk_ids = [yandex_compute_instance.webserver1.boot_disk.0.disk_id, yandex_compute_instance.webserver2.boot_disk.0.disk_id, yandex_compute_instance.kibana.boot_disk.0.disk_id, yandex_compute_instance.elastic.boot_disk.0.disk_id, yandex_compute_instance.grafana.boot_disk.0.disk_id, yandex_compute_instance.prometeus.boot_disk.0.disk_id, yandex_compute_instance.bastion.boot_disk.0.disk_id]
}

output "schedule_snapshot" {
  value = yandex_compute_snapshot_schedule.default.disk_ids
}