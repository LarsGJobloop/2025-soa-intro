variable "hetzner_token" {
  sensitive   = true
  description = "Hetzner API token for Terraform access"
  type        = string
  nullable    = false
}
