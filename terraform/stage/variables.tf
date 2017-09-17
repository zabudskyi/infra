variable project {
  description = "Project ID"
}

variable region {
  description = "Region"
  default     = "europe-west1"
}

variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable private_key_path {
  description = "Path to the private key used for ssh access"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}

variable db_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-db-base"
}

variable app_instance_name {
  description = "Instance name"
}

variable app_machine_type {
  description = "Resources machine type"
}

variable app_zone {
  description = "VM instance zone location"
}

variable db_instance_name {
  description = "Instance name"
}

variable db_machine_type {
  description = "Resources machine type"
}

variable db_zone {
  description = "VM instance zone location"
}

variable source_ranges {
  type = "list"
  description = "Allowed IP addresses"
}
