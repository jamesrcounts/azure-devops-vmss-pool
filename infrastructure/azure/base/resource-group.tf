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