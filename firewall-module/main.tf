resource "google_compute_firewall" "firewall_rule" {
  for_each = var.firewall_rules

  name                = each.key
  network             = var.network_name
  priority            = each.value.priority
  direction           = each.value.direction
  disabled            = each.value.disabled
  destination_ranges  = each.value.destination_ranges
  source_ranges       = each.value.source_ranges
  source_tags         = each.value.source_tags
  target_tags         = each.value.target_tags
  source_service_accounts = each.value.source_service_accounts
  target_service_accounts = each.value.target_service_accounts

  dynamic "allow" {
    for_each = each.value.allow
    content {
      protocol = allow.value.protocol
      ports    = allow.value.ports
    }
  }

  dynamic "deny" {
    for_each = each.value.deny
    content {
      protocol = deny.value.protocol
      ports    = deny.value.ports
    }
  }

  log_config {
    metadata = each.value.log_config.metadata
  }
}
