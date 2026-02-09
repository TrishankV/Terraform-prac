# nic.tf
# creating multiple nics 

resource "azurerm_network_interface" "nics" { 
    count = var.niccount
    name = "webinteraface0${count.index+1}"
    resource_group_name = local.rgname 
    location = local.loc

    ip_configuration  { 
        name = "primary"
        primary = true 
        subnet_id = azurerm_subnet.webspaces["webspace1"].id 
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id = azurerm_public_ip.ipp[count.index].id
    }
}

# Here the public ip adresses would be mapped to the number of interfaces using the count method 

resource "azurerm_public_ip" "ipp" {
    count = var.niccount
    name = "webip0${count.index+1}"
    resource_group_name = local.rgname
    location = local.loc
    allocation_method = "Static"
}
