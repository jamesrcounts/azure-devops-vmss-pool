source "azure-arm" "agent" {
  client_id                                     = "${var.client_id}"
  client_secret                                 = "${var.client_secret}"
  image_offer                                   = "UbuntuServer"
  image_publisher                               = "Canonical"
  image_sku                                     = "18_04-lts-gen2"
  location                                      = "${var.location}"
  managed_image_name                            = "${var.managed_image_name}"
  managed_image_resource_group_name             = "${var.managed_image_resource_group_name}"
  os_disk_size_gb                               = "100"
  os_type                                       = "Linux"
  private_virtual_network_with_public_ip        = true
  subscription_id                               = "${var.subscription_id}"
  tenant_id                                     = "${var.tenant_id}"
  virtual_network_name                          = "${var.virtual_network_name}"
  virtual_network_resource_group_name           = "${var.virtual_network_resource_group_name}"
  virtual_network_subnet_name                   = "${var.virtual_network_subnet_name}"
  vm_size                                       = "${var.vm_size}"
  shared_gallery_image_version_end_of_life_date = timeadd(timestamp(), "240h")

  azure_tags = {
    project = "ado-vmss-pool"
  }

  shared_image_gallery_destination {
    gallery_name        = "${var.sig_name}"
    image_name          = "custom"
    image_version       = "${var.sig_image_version}"
    replication_regions = ["${var.location}"]
    resource_group      = "${var.managed_image_resource_group_name}"
    subscription        = "${var.subscription_id}"
  }
}

build {
  sources = ["source.azure-arm.agent"]
}
