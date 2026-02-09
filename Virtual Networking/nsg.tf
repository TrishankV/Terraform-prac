# nsg.tf 
# Creating a NSG security rule such that it allows the access of public ip
# ad dress through only RDP conection and port , and the subnet resource was 
# to map all the public ip which were created using the count method and covering them in the NSG security rule 

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
}

resource "azurerm_subnet_network_security_group_association" "websubnet01_appnsg" {
    for_each = azurerm_subnet.webspaces
    subnet_id = azurerm_subnet.webspaces[each.key].id
    network_security_group_id = azurerm_network_security_group.commando.id
}
