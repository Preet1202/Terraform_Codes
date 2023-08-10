resource "azurerm_virtual_network" "vnet" {
  name                = "vnet11"
  address_space       = ["10.0.0.0/16"]
  location            = local.azure_region
  resource_group_name = var.resource_group_name
}


resource "azurerm_subnet" "subnet2" {
  name                 = "subnet22"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]

    delegation {
        name = "example-delegation"

        service_delegation {
        name    = "Microsoft.Web/serverFarms"
        actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
        }
    }

}