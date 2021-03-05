resource "azurerm_resource_group" "main" {
  name     = "rg-${local.project}"
  location = "centralus"
  tags     = local.tags
}

resource "azurerm_resource_group" "images" {
  name     = "rg-${local.project}-images"
  location = "centralus"
  tags     = local.tags
}