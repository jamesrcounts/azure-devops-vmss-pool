locals {
  project = "ado-vmss-pool"

  tags = {
    project = local.project
  }
}

resource "random_pet" "fido" {}