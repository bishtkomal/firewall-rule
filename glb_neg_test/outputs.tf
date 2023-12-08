output "glb_ip" {
  value       = google_compute_global_address.default.address
  description = "The IP address of the GLB."
}
