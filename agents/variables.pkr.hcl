variable "client_id" {
  type    = string
  default = "${env("ARM_CLIENT_ID")}"
}

variable "client_secret" {
  type      = string
  default   = "${env("ARM_CLIENT_SECRET")}"
  sensitive = true
}

variable "location" {
  type    = string
  default = "${env("ARM_RESOURCE_LOCATION")}"
}

variable "managed_image_name" {
  type    = string
  default = "${env("MANAGED_IMAGE_NAME")}"
}

variable "managed_image_resource_group_name" {
  type    = string
  default = "${env("ARM_RESOURCE_GROUP")}"
}

variable "sig_image_version" {
  type = string
}

variable "sig_name" {
  type    = string
  default = "${env("SIG_NAME")}"
}

variable "subscription_id" {
  type    = string
  default = "${env("ARM_SUBSCRIPTION_ID")}"
}

variable "tenant_id" {
  type    = string
  default = "${env("ARM_TENANT_ID")}"
}

variable "virtual_network_name" {
  type = string
}

variable "virtual_network_resource_group_name" {
  type = string
}

variable "virtual_network_subnet_name" {
  type = string
}

variable "vm_size" {
  type    = string
  default = "Standard_D4ds_v4"
}
