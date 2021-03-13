variable "client_id" {
  type = string
}

variable "client_secret" {
  type      = string
  sensitive = true
}

variable "location" {
  type = string
}

variable "managed_image_name" {
  type = string
}

variable "managed_image_resource_group_name" {
  type = string
}

variable "sig_image_version" {
  type = string
}

variable "sig_name" {
  type = string
}

variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string
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
