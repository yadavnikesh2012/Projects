data "azurerm_subnet" "subnet" {
  for_each             = var.nics
  name                 = each.value.nic_subnet_name
  virtual_network_name = each.value.nic_vnet_name
  resource_group_name  = each.value.nic_resource_group_name
}

data "azurerm_public_ip" "public_ip" {
  for_each            = var.nics
  name                = each.value.nic_pip_name
  resource_group_name = each.value.nic_resource_group_name
}

resource "azurerm_network_interface" "nic" {
  for_each            = var.nics
  name                = each.value.nic_name
  location            = each.value.nic_location
  resource_group_name = each.value.nic_resource_group_name

  ip_configuration {
    name                          = "rg1-ip"
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    public_ip_address_id          = data.azurerm_public_ip.public_ip[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}