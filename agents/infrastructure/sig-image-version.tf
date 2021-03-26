data "azurerm_shared_image_version" "custom" {
  name                = local.shared_image_version
  image_name          = data.azurerm_key_vault_secret.secrets["sig-image-name"].value
  gallery_name        = data.azurerm_key_vault_secret.secrets["sig-name"].value
  resource_group_name = data.azurerm_key_vault_secret.secrets["rg-images"].value
}
    