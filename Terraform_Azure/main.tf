data "azurerm_subnet" "tinfoilvpn" { #--We need to look this up as as list as we need to get the ID of the Subnet
    name                 = var.transport_subnet_address_space[count.index]
    count                = length(var.transport_subnet_address_space)
    resource_group_name  = var.resource_group
    virtual_network_name = var.vnet
}

resource "azurerm_local_network_gateway" "madcaplaughs" {
    name                = var.peer_vpn_gateway
    location            = var.location
    resource_group_name = var.resource_group
    gateway_address     = "192.168.2.231" #--Your local device public IP here
    address_space       = var.peer_subnet_address_spaces
}

resource "azurerm_public_ip" "tinfoilvpn" {
    name                = var.vpn_public_ip
    location            = var.location
    resource_group_name = var.resource_group
    allocation_method   = "Dynamic" #--Dynamic set means Azure will generate an IP for your Azure VPN Gateway
}

resource "azurerm_virtual_network_gateway" "tinfoilvpn" {
    name                    = var.vpn_gateway
    location                = var.location
    resource_group_name     = var.resource_group
    type                    = "Vpn" #--Other option is ExpressRoute, predictably for ExpressRoute VPNs
    vpn_type                = "RouteBased" #--Policy based is also acceptable here, depending on your use case
    active_active           = false
    enable_bgp              = false
    sku                     = "Basic" #--A whole load of oddities occur around SKUs, see MS Docs for details
    ip_configuration {
        public_ip_address_id          = azurerm_public_ip.tinfoilvpn.id
        private_ip_address_allocation = "Dynamic"
        subnet_id                     = data.azurerm_subnet.tinfoilvpn.0.id #--There's that ID we needed, for the Transport Subnet
    }
}

resource "azurerm_virtual_network_gateway_connection" "tinfoilvpn" {
    name                       = var.vpn_connection
    location                   = var.location
    resource_group_name        = var.resource_group
    type                       = "IPsec"
    virtual_network_gateway_id = azurerm_virtual_network_gateway.tinfoilvpn.id
    local_network_gateway_id   = azurerm_local_network_gateway.madcaplaughs.id
    shared_key                 = var.vpn_psk #-Provided at run time
}