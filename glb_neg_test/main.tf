provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_compute_global_address" "default" {
  name = "${var.glb_name}-ip"
}

resource "google_compute_backend_service" "default" {
  name                  = "${var.glb_name}-backend-service"
  protocol              = "HTTP"
  load_balancing_scheme = "EXTERNAL"
  
  dynamic "backend" {
    for_each = var.negs
    content {
      group = backend.value
      balancing_mode        = "RATE"
      max_rate_per_endpoint = 100 // Set an appropriate rate limit per endpoint
    }
  }

  health_checks = [google_compute_health_check.default.id]
}


resource "google_compute_health_check" "default" {
  name = "${var.glb_name}-hc"

  http_health_check {
    port = 80
  }
}

resource "google_compute_url_map" "default" {
  name            = "${var.glb_name}-url-map"
  default_service = google_compute_backend_service.default.id
}

resource "google_compute_target_http_proxy" "default" {
  name    = "${var.glb_name}-http-proxy"
  url_map = google_compute_url_map.default.id
}

resource "google_compute_global_forwarding_rule" "default" {
  name       = "${var.glb_name}-http-forwarding-rule"
  target     = google_compute_target_http_proxy.default.id
  port_range = "80"
  ip_address = google_compute_global_address.default.address
}
