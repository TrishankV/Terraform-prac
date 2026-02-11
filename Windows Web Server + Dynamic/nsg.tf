# nsg.tf 
# using dynamic block such that the rules get applier using a loop within a resource 

resource "azurerm_network_security_group" "commando" { 
    name = "nsgcommandoi"
    location = local.loc 
    resource_group_name = local.rgname

    dynamic security_rule {
        for_each = local.nsg_security_rules
        content { 
        name = "Allow-${security_rule.value.destination_port_range}"
        priority = security_rule.value.priority
        direction = "Inbound"
        access = "Allow"
        protocol = "Tcp"
        source_port_range = "*"
        destination_port_range = security_rule.value.destination_port_range
        source_address_prefix = "*"
        destination_address_prefix = "*"
        }
    }
}

resource "azurerm_subnet_network_security_group_association" "subnet_appnsg" {
    for_each = azurerm_subnet.app_subnets
    subnet_id = azurerm_subnet.app_subnets[each.key].id
    network_security_group_id = azurerm_network_security_group.commando.id
}