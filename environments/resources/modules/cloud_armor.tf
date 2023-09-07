resource "google_compute_security_policy" "cloud-armor" {
  name = "${var.project_id}-cloudarmor"

  description = "Cloud Armor Security Policy"


  dynamic "rule" {
    for_each = var.cloud_armor_rules
    content {
      priority    = rule.value.priority
      action      = rule.value.action
      description = rule.value.description

      dynamic "match" {
        for_each = toset(rule.value.match)
        content {
          versioned_expr = match.value.versioned_expr
          config {
            src_ip_ranges = match.value.config.src_ip_ranges
          }
        }
      }
    }
  }

}