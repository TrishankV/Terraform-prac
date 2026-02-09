# nic.tf
# creating multiple nics 

resource "azurerm_network_interface" "nics" { 
    count = 3
    name = "webinteraface0${count.index+1}"
    resource_group_name = local.rgname 
    location = local.loc

    ip_configuration  { 
        name = "primary"
        primary = true 
        subnet_id = azurerm_subnet.webspaces["webspace1"].id 
        private_ip_address_allocation = "Dynamic"
    }
}
