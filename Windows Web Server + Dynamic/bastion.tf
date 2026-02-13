# Bastion.html 
local.rgname

resource "azurerm_subnet" "bastionsubnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = local.rgname
  virtual_network_name = azurerm_virtual_network.app_vnet.name
  address_prefixes     = ["110.0.2.0/24"]
}

resource "azurerm_public_ip" "bastionip" {
  name                = "bastion-ip"
  location            = local.loc
  resource_group_name = local.rgname
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "example" {
  name                = "appbastion"
  location            = local.loc
  resource_group_name = local.rgname

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.bastionsubnet.id
    public_ip_address_id = azurerm_public_ip.bastionip.id
  }
}