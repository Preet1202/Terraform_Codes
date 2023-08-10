variable "location" {
    type        = string
    description = "Primary Location"
    default      = "ind-central"
}


#--Service Principle Secret
variable "vpn_psk" {
    type        = string
    description = "VPN PSK"
    default = "123456"
}

#####################
#---Deploy Params---#
#####################

#--Resource Groups
variable "resource_group" {
    description = "Resource Group"
    type        = string
    default     = "rg_webapp"
}

#--Base VNet
variable "vnet" {
    description = "Base vnet"
    type        = string
    default     = "vnet1"
}

#--Subnet Address Spaces
variable "peer_subnet_address_spaces" {
    description = "All peer subnets"
    type        = list(string)
    default     = ["10.0.1.0/24",]
}

#--Transport Subnet Address Space
variable "transport_subnet_address_space" {
    description = "All subnets"
    type        = list(string)
    default     = ["10.1.1.0/24"]
}

#--VPN Gateway
variable "vpn_gateway" {
    description = "VPN Gateway"
    type        = string
    default     = "VNet1GW"
}

#--Peer VPN Gateway
variable "peer_vpn_gateway" {
    description = "Peer VPN Gateway"
    type        = string
    default     = "HubRMToSpokeRM"
}

#--VPN Connection
variable "vpn_connection" {
    description = "VPN Connection"
    type        = string
    default     = "VNet1toSite1"
}

#--VPN Connection
variable "vpn_public_ip" {
    description = "VPN Public IP"
    type        = string
    default     = "20.204.188.130"
}