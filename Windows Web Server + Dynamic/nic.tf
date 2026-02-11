# nic.tf
# creating multiple nics 

resource "azurerm_network_interface" "nics" { 
    name = var.app_environment.prod.niname
    resource_group_name = local.rgname 
    location = local.loc

    ip_configuration  { 
        name = "internal"
        subnet_id = azurerm_subnet.app_subnets["websubnet01"].id 
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id = azurerm_public_ip.ipp.id
    }
}

resource "azurerm_public_ip" "ipp" {
    name = var.app_environment.prod.publibipname
    resource_group_name = local.rgname
    location = local.loc
    allocation_method = "Static"
}

