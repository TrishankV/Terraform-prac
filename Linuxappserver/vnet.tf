# Virtual NEtwork.tf 

resource "azurerm_virtual_network" "app_vnet" { 
    name = var.app_environment.prod.vnname
    resource_group_name = local.rgname
    location = local.loc 
    address_space = [var.app_environment.prod.vncidr]
}

resource "azurerm_subnet" "app_subnets" { 
    for_each = var.app_environment.prod.subnets
    name = each.key
    virtual_network_name = var.app_environment.prod.vnname
    address_prefixes = [each.value.cidr]
    resource_group_name = local.rgname
    }