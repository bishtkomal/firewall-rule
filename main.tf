module "gcp_firewall" {
  source        = "./firewall-module"
  network_name  = var.network_name
  firewall_rules = var.firewall_rules
}
