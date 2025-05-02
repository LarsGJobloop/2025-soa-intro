resource "hcloud_network" "private_network" {
  name     = "private-network"
  ip_range = "10.0.0.0/16"
}

resource "hcloud_network_subnet" "subnet" {
  network_id   = hcloud_network.private_network.id
  type         = "cloud"
  network_zone = local.zone
  ip_range     = "10.0.1.0/24"
}

resource "hcloud_load_balancer" "loadbalancer" {
  name               = "loadbalancer"
  load_balancer_type = "lb11"
  location           = local.location
}

resource "hcloud_load_balancer_target" "target_service_server" {
  load_balancer_id = hcloud_load_balancer.loadbalancer.id
  type             = "label_selector"
  label_selector   = "role=services"
}

resource "hcloud_load_balancer_service" "http_service" {
  load_balancer_id = hcloud_load_balancer.loadbalancer.id
  protocol         = "http"

  listen_port      = 80
  destination_port = 80
}
