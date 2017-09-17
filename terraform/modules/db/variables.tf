variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable db_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-db-base"
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
