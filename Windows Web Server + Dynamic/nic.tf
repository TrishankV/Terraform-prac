# nic.tf
resource "azurerm_network_interface" "nics" { 
    for_each = var.app_environment.prod.subnets["websubnet01"].machines
    name = each.value.niname
    resource_group_name = local.rgname 
    location = local.loc

    ip_configuration  { 
        name = "internal"
        subnet_id = azurerm_subnet.app_subnets["websubnet01"].id 
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id = azurerm_public_ip.ipp[each.key].id
    }
}

resource "azurerm_public_ip" "ipp" {
    for_each = var.app_environment.prod.subnets["websubnet01"].machines
    name = each.value.publibipname
    resource_group_name = local.rgname
    location = local.loc
    allocation_method = "Static"
}

