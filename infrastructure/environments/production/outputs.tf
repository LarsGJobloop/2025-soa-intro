output "service_info" {
  value = {
    ipv4 = hcloud_load_balancer.loadbalancer.ipv4
  }
}

output "server_info" {
  description = "Server public IP address. Fix this for production environments."
  value       = module.compose_server.server_info
}
