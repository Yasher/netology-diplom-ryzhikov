resource "yandex_compute_snapshot_schedule" "default" {
  name           = "schedule-test"

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

  disk_ids = ["ef3e17qu3ehgnhpogguj", "ef3ic0bfomjm4ta2peot", "ef3qa3oqgcfe2pt9nudj"]
}

output "schedule_snaopshot" {
  value = yandex_compute_snapshot_schedule.default.disk_ids
}