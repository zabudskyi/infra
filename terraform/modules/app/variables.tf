variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
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
