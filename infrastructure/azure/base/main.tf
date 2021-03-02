locals {
  project = "ado-vmss-pool"

  tags = {
    project = local.project
  }
}

data "azurerm_client_config" "current" {}
resource "random_pet" "fido" {}