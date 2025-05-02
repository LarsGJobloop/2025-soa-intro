terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.50"
    }
  }
}

locals {
  ssh_public_key = file(var.ssh_public_key_file)
}

resource "hcloud_server" "server" {
  name        = "${var.name}-server"
  image       = "debian-12"
  server_type = var.instance_type
  location    = var.location
  user_data = templatefile("${path.module}/cloud-init.tftpl", {
    ssh_public_key   = local.ssh_public_key
    compose_url      = var.compose_url
    refresh_interval = var.refresh_interval
    hostname         = var.hostname
    server_fqdn      = var.server_fqdn != null ? var.server_fqdn : "${var.name}.internal"
  })

  labels = var.labels

  public_net {
    ipv4_enabled = true
    ipv6_enabled = false
  }

  network {
    network_id = var.network_id
    alias_ips  = [] # Fixes https://github.com/hetznercloud/terraform-provider-hcloud/issues/650
  }
}
