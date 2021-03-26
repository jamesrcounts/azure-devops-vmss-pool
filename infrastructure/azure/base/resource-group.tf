resource "azurerm_resource_group" "main" {
  name     = "rg-${local.project}"
  location = local.location
  tags     = local.tags
}

resource "azurerm_resource_group" "images" {
  name     = "rg-${local.project}-images"
  location = local.location
  tags     = local.tags
}

locals {
  keyvault_crypto_users = {
    des_vmss   = azurerm_disk_encryption_set.des.identity.0.principal_id
    storage_tf = azurerm_storage_account.tfbackend.identity.0.principal_id
  }
}

resource "azurerm_role_assignment" "keyvault_crypto_user" {
  for_each = local.keyvault_crypto_users

  principal_id         = each.value
  role_definition_name = "Key Vault Crypto User"
  scope                = azurerm_resource_group.main.id
}