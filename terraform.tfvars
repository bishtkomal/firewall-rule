gcp_project   = "kcctestabsipat"
gcp_region    = "us-central1"
network_name  = "default"

firewall_rules = {
  "firewall-rule-network-tag" = {
    priority = 1000
    allow = [{
      protocol = "tcp"
      ports    = ["80", "443"]
    }]
    source_tags   = ["web-server"]
    target_tags   = ["allow-http-https"]
    log_config = {
      metadata = "INCLUDE_ALL_METADATA"
    }
    direction = "INGRESS"  # Specify direction
    disabled  = false      # Optional
  },
  "firewall-rule-cidr-range" = {
    priority = 1001
    allow = [{
      protocol = "tcp"
      ports    = ["22"]
    }]
    source_ranges = ["192.168.1.0/24"]
    target_tags   = ["ssh-access"]
    log_config = {
      metadata = "EXCLUDE_ALL_METADATA"
    }
    direction = "INGRESS"
    disabled  = false
  },
  "firewall-rule-egress-combo" = {
    priority = 1002
    allow = [{
      protocol = "tcp"
      ports    = ["80"]
    }]
    destination_ranges = ["10.0.1.0/24"]
    target_tags     = ["internal-traffic"]
    log_config = {
      metadata = "INCLUDE_ALL_METADATA"
    }
    direction = "EGRESS"  # Changed to EGRESS
    disabled  = false
  }
}

