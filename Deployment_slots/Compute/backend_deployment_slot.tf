resource "azurerm_windows_web_app_slot" "WASlot" {
  name                = var.app_services_slot_name
  app_service_id      = azurerm_windows_web_app.back_end_web_app.id
  virtual_network_subnet_id = azurerm_subnet.subnet2.id

  site_config {
      application_stack{
        current_stack = "dotnet"
        dotnet_version = "v6.0"
      }
      always_on                = false
      vnet_route_all_enabled = true

  }
}