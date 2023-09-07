output "global_static_ip" {
  value = google_compute_global_address.ipv4.address
}
