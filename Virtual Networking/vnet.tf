# Vnet and Subnet resoruces 

resource "azurerm_virtual_network" "vnett" { 
    name = local.vn.name
    resource_group_name = local.rgname
    location = local.loc 
    address_space = local.vn.ad
}

# USing for_each for creatign multiple subnets at a time 
resource "azurerm_subnet" "webspaces" { 
    for_each = { 
        webspace1 = "10.0.0.0/24"
        webspace2 = "10.0.1.0/24"
    }
    name = each.key
    virtual_network_name = local.vn.name
    address_prefixes = [each.value]
    resource_group_name = local.rgname
    }
