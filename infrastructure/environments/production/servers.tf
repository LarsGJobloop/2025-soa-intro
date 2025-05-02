locals {
  name     = "fullstack-gitops-lite"
  location = "hel1"
  zone     = "eu-central"
}

module "compose_server" {
  source              = "../../modules/compose-gitops-lite-server"
  name                = "fullstack-gitops-lite"
  location            = "hel1"
  instance_type       = "cax11"
  hostname            = "services"
  ssh_public_key_file = "${path.root}/id_rsa.pub"

  compose_url      = "https://raw.githubusercontent.com/LarsGJobloop/fullstack-gitops-lite/refs/heads/main/manifests/compose.yaml"
  refresh_interval = "*/1 * * * *" // Every 1 minute

  network_id = hcloud_network.private_network.id

  labels = {
    role = "services"
  }

  depends_on = [hcloud_network_subnet.subnet]
}
