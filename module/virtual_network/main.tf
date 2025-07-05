resource "azurerm_virtual_network" "vn" {
  name                = var.virtual_network_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
}