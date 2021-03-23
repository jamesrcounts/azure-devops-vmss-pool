locals {
  ops_secrets = {
    "agents-subnet-id"            = azurerm_subnet.internal.id
    "agents-vnet-name"            = azurerm_virtual_network.ops.name
    "disk-encryption-set-id"      = azurerm_disk_encryption_set.des.id
    "location"                    = local.location
    "log-analytics-workspace-id"  = azurerm_log_analytics_workspace.insights.workspace_id
    "log-analytics-workspace-key" = azurerm_log_analytics_workspace.insights.primary_shared_key
    "packer-subnet-name"          = azurerm_subnet.packer.name
    "rg-images"                   = azurerm_resource_group.images.name
    "rg-vnet"                     = azurerm_virtual_network.ops.resource_group_name
    "sig-name"                    = azurerm_shared_image_gallery.images.name
    "tf-storage-account"          = azurerm_storage_account.tfbackend.name
    "tf-storage-blob-container"   = azurerm_storage_container.state.name
  }
}

resource "azurerm_key_vault" "ops" {
  enable_rbac_authorization       = true
  enabled_for_deployment          = false
  enabled_for_disk_encryption     = false
  enabled_for_template_deployment = false
  location                        = azurerm_resource_group.main.location
  name                            = "kv-${local.project}-ops"
  purge_protection_enabled        = false
  resource_group_name             = azurerm_resource_group.main.name
  sku_name                        = "standard"
  soft_delete_retention_days      = 30
  tags                            = local.tags
  tenant_id                       = data.azurerm_client_config.current.tenant_id
}

resource "azurerm_key_vault_secret" "secrets" {
  for_each = local.ops_secrets

  name         = each.key
  value        = each.value
  key_vault_id = azurerm_key_vault.ops.id
  tags         = local.tags
}