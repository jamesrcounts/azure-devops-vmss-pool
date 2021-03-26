locals {
  project  = "ado-vmss-pool"
  shared_image_version = var.shared_image_version

  tags = {
    project = local.project
  }
}

resource "random_pet" "fido" {}
data "azurerm_client_config" "current" {}