provider "google" {
  credentials = "${file("../../account.json")}"
  project     = "${var.project}"
  region      = "${var.region}"
}

module "app" {
  source = "../modules/app"

  public_key_path   = "${var.public_key_path}"
  app_disk_image    = "${var.app_disk_image}"
  app_instance_name = "${var.app_instance_name}"
  app_machine_type  = "${var.app_machine_type}"
  app_zone          = "${var.app_zone}"
}

module "db" {
  source = "../modules/db"

  public_key_path  = "${var.public_key_path}"
  db_disk_image    = "${var.db_disk_image}"
  db_instance_name = "${var.db_instance_name}"
  db_machine_type  = "${var.db_machine_type}"
  db_zone          = "${var.db_zone}"
}

module "vpc" {
  source        = "../modules/vpc"
  source_ranges = "${var.source_ranges}"
}
