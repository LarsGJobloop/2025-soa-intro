variable "name" {
  description = "Name of application"
  type        = string
}

variable "location" {
  description = "The datacenter location"
  type        = string
}

variable "instance_type" {
  description = "The type of machine to use"
  type        = string
}

variable "network_id" {
  description = "The network configuration to pass in"
  type        = string
}

variable "compose_url" {
  description = "Location to download the Docker Compose file from"
  type        = string
  nullable    = false
}

variable "refresh_interval" {
  description = <<EOT
Cron-style expression that defines how frequently the deployment will be refreshed.

Format: [minute] [hour] [day_of_month] [month] [day_of_week]
Example: "*/30 * * * *" — every 30 minutes.

Field meanings:
- minute (0-59)
- hour (0-23)
- day_of_month (1-31)
- month (1-12 or JAN-DEC)
- day_of_week (0-6 or SUN-SAT, where Sunday=0)

Notes:
- This uses standard 5-field cron syntax (no seconds field).
- Timezone is determined by the runtime environment.
- Common shorthand expressions (e.g., @hourly, @daily) are not supported; use full cron expressions.

EOT
  type        = string
  nullable    = false
}

variable "labels" {
  description = "Labels to annotate the server with"
  type        = map(string)
  nullable    = true
}

variable "hostname" {
  description = "Hostname to use for server"
  type        = string
  nullable    = false
}

variable "ssh_public_key_file" {
  description = "Path to the public key file for use trusting by the server"
  type        = string
  nullable    = false
}

variable "server_fqdn" {
  description = "Optional FQDN to assign to the server during bootstrap"
  type        = string
  nullable    = true
  default     = null
}
