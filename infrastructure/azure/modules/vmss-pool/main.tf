locals {
  sku = local.skus[var.sku]

  // TODO is there an API to look this up?
  skus = {
    "Standard_DS2_v2" = {
      name         = "Standard_DS2_v2"
      disk_size_gb = 86
    }
    "Standard_D4ds_v4" = {
      name         = "Standard_D4ds_v4"
      disk_size_gb = 100
    }
  }
}