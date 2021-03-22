resource "azurerm_storage_account" "tfbackend" {
  name                      = substr(replace("sa-${local.project}-tf-${random_pet.fido.id}", "-", ""), 0, 24)
  resource_group_name       = azurerm_resource_group.main.name
  location                  = azurerm_resource_group.main.location
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "GRS"
  access_tier               = "Cool"
  enable_https_traffic_only = true
  min_tls_version           = "TLS1_2"
  allow_blob_public_access  = false
  is_hns_enabled            = false
  large_file_share_enabled  = false
  tags                      = local.tags

  identity {
    type = "SystemAssigned"
  }

  blob_properties {
    delete_retention_policy {
      days = 7
    }
  }

  network_rules {
    bypass = [
      "AzureServices",
    ]
    default_action             = "Deny"
    ip_rules                   = []
    virtual_network_subnet_ids = []
  }

}

resource "azurerm_storage_account_customer_managed_key" "tf" {
  depends_on = [
    azurerm_role_assignment.keyvault_crypto_user
  ]

  storage_account_id = azurerm_storage_account.tfbackend.id
  key_vault_id       = azurerm_key_vault.os_encryption.id
  key_name           = azurerm_key_vault_key.tf.name
}