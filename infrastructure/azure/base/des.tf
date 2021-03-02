resource "azurerm_disk_encryption_set" "des" {
  key_vault_key_id    = azurerm_key_vault_key.des.id
  location            = azurerm_resource_group.main.location
  name                = "des-${local.project}"
  resource_group_name = azurerm_resource_group.main.name
  tags                = local.tags

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_role_assignment" "keyvault_crypto_user" {
  principal_id         = azurerm_disk_encryption_set.des.identity.0.principal_id
  role_definition_name = "Key Vault Crypto User"
  scope                = azurerm_resource_group.main.id
}