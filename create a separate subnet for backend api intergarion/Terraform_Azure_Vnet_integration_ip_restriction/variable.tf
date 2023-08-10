variable "frontend_service_plan_name" {
  type        = string
  description = "The name which should be used for frontend service plan."
  default     = "asp-frontend"
}
variable "frontend_service_plan_os_type" {
  type        = string
  description = "The O/S type for the App Services to be hosted in this plan. Possible values include `Windows`, `Linux` and `WindowsContainer`."
  default     = "Linux" #"Windows", "Linux", "WindowsContainer"
}
variable "frontend_service_plan_sku_name" {
  type        = string
  description = "The SKU for the plan. Possible values include `B1`, `B2`, `B3`, `D1`, `F1`, `I1`, `I2`, `I3`, `I1v2`, `I2v2`, `I3v2`, `P1v2`, `P2v2`, `P3v2`, `P1v3`, `P2v3`, `P3v3`, `S1`, `S2`, `S3`, `SHARED`, `EP1`, `EP2`, `EP3`, `WS1`, `WS2`, `WS3` and `Y1`."
  default     = "B1"
}

variable "resource_group_name"{
    type= string
    default= "rg_terraform"
}
variable "fnapp" {
   type = string
   default="fnapppew"
}