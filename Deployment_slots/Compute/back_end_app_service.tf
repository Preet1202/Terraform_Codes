# Create windows  web App for Back-End 
resource "azurerm_windows_web_app" "back_end_web_app" {
  name                = var.back_end_app_name
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = local.azure_region
  tags                = local.tags
  service_plan_id     = azurerm_service_plan.backend_service_plan.id
  https_only          = true

  site_config {
    always_on                = true
    ftps_state               = "FtpsOnly"
    http2_enabled            = true
    remote_debugging_enabled = false
    application_stack {
      dotnet_version = "v4.0"
    }
  }
}