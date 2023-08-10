resource "azurerm_linux_web_app_slot" "webapps-slot" {
  name                      = var.app_services_slot_name
  app_service_id            = azurerm_linux_web_app.front_end_web_app.id
  https_only                = true
  virtual_network_subnet_id = azurerm_subnet.subnet2.id
  site_config {
       vnet_route_all_enabled = true   #all outbound traffic have NAT Gateways, Network Security Groups and User Defined Routes applied
  }
}

# resource "azurerm_app_service_slot" "app_service_slot" {
#   name                = var.app_services_slot_name
#   resource_group_name = var.resource_group_name
#   location            = local.azure_region
#   app_service_plan_id = azurerm_service_plan.frontend_service_plan.id
#   app_service_name    = azurerm_linux_web_app.front_end_web_app.name
#   https_only          = true

#   site_config {
#     vnet_route_all_enabled = true
#   }

#   identity {
#     type = "SystemAssigned"
#   }
# }