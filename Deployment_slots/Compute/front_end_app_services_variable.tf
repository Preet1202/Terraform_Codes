variable "front_end_app_name" {
  type        = string
  description = "The name which should be used for this Linux Function App. Limit the function name to 32 characters to avoid naming collisions."
  default = "rewardportalll"
}
variable "resource_group_name" {
  type = string
  default = "rg_demo"
}