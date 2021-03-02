resource "azurerm_key_vault" "os_encryption" {
  enable_rbac_authorization   = true
  enabled_for_disk_encryption = true
  location                    = azurerm_resource_group.main.location
  name                        = "kv-${local.project}-des"
  purge_protection_enabled    = true
  resource_group_name         = azurerm_resource_group.main.name
  sku_name                    = "standard"
  soft_delete_retention_days  = 7
  tags                        = local.tags
  tenant_id                   = data.azurerm_client_config.current.tenant_id
}

resource "azurerm_key_vault_key" "des" {
  name         = "des-key-${local.project}"
  key_vault_id = azurerm_key_vault.os_encryption.id
  key_type     = "RSA"
  key_size     = 4096
  tags         = local.tags

  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
  ]
}