variable public_key_path {
  description = "Path to the public key used for ssh access"
}
variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}
variable subnet_id {
  description = "Subnets for modules"
}
variable "name" {
  description = "Environment name"
  type        = string
}
variable "private_key_path" {
  description = "Path to privat key path"
}
variable db_ip_addr {
  description = "Database IP address"
  default     = "127.0.0.1"
}
