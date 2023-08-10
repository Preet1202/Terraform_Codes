resource "azurerm_service_plan" "frontend_service_plan" {
  name                = var.frontend_service_plan_name
  resource_group_name = var.resource_group_name
  location            = local.azure_region
  os_type             = var.frontend_service_plan_os_type
  sku_name            = var.frontend_service_plan_sku_name
  tags                = local.tags
}

# Create App service plan for Back End(RewardportalAPI)
resource "azurerm_service_plan" "backend_service_plan" {
  name                = var.backend_service_plan_name
  resource_group_name = var.resource_group_name
  location            = local.azure_region
  os_type             = var.backend_service_plan_os_type
  sku_name            = var.backend_service_plan_sku_name
  tags                = local.tags
}
