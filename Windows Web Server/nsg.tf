# nsg.tf 

resource "azurerm_network_security_group" "commando" { 
    name = "nsgcommandoi"
    location = local.loc 
    resource_group_name = local.rgname

    security_rule {
        name = "AloowRDP"
        priority = 300
        direction = "Inbound"
        access = "Allow"
        protocol = "Tcp"
        source_port_range = "*"
        destination_port_range = "3389"
        source_address_prefix = "*"
        destination_address_prefix = "*"

    }

    security_rule {
    name                       = "AllowHTTP"
    priority                   = 310
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "subnet_appnsg" {
    for_each = azurerm_subnet.app_subnets
    subnet_id = azurerm_subnet.app_subnets[each.key].id
    network_security_group_id = azurerm_network_security_group.commando.id
}