resource "azurerm_shared_image_gallery" "images" {
  description         = "Custom VM Images."
  location            = azurerm_resource_group.images.location
  name                = replace("sig-${local.project}", "-", ".")
  resource_group_name = azurerm_resource_group.images.name
  tags                = local.tags
}

resource "azurerm_shared_image" "custom" {
  description         = "Custom build agent."
  gallery_name        = azurerm_shared_image_gallery.images.name
  hyper_v_generation  = "V2"
  location            = azurerm_resource_group.images.location
  name                = "custom"
  os_type             = "Linux"
  resource_group_name = azurerm_resource_group.images.name
  specialized         = false
  tags                = local.tags

  identifier {
    offer     = "Custom"
    publisher = local.project
    sku       = "custom"
  }
}