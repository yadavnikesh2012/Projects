rgs = {
  rg1 = {
    name     = "dev45"
    location = "centralindia"
  }
}

vnets = {
  vnet1 = {
    name                = "vnet-rg1"
    location            = "centralindia"
    resource_group_name = "dev45"
    address_space       = ["10.0.0.0/16"]

  }
}

subnets = {
  subnet1 = {
    name                 = "frontend-subnet"
    resource_group_name  = "dev45"
    virtual_network_name = "vnet-rg1"
    address_prefixes     = ["10.0.1.0/24"]
  }

  subnet2 = {
    name                 = "backend-subnet"
    resource_group_name  = "dev45"
    virtual_network_name = "vnet-rg1"
    address_prefixes     = ["10.0.2.0/24"]
  }
}

public_ips = {
  pip1 = {
    name                = "frontend-vm-pip"
    location            = "centralindia"
    resource_group_name = "dev45"
    allocation_method   = "Static"
  }

  pip2 = {
    name                = "backend-vm-pip"
    location            = "centralindia"
    resource_group_name = "dev45"
    allocation_method   = "Static"
  }
}

nics = {
  nic1 = {
    nic_name                = "frontend-vm-nic"
    nic_location            = "centralindia"
    nic_resource_group_name = "dev45"
    nic_vnet_name           = "vnet-rg1"
    nic_subnet_name         = "frontend-subnet"
    nic_pip_name            = "frontend-vm-pip"
  }
  nic2 = {
    nic_name                = "backend-vm-nic"
    nic_location            = "centralindia"
    nic_resource_group_name = "dev45"
    nic_vnet_name           = "vnet-rg1"
    nic_subnet_name         = "backend-subnet"
    nic_pip_name            = "backend-vm-pip"
  }
}


virtual_machine = {
  vm1 = {
    vm_name             = "frontend-vm"
    nic_name            = "frontend-vm-nic"
    public_ip_name      = "frontend-vm-pip"
    location            = "CentralIndia"
    resource_group_name = "dev45"
    vnet_name           = "vnet-rg1"
    subnet_name         = "frontend-subnet"
    vm_size             = "Standard_B2ats_v2"
    admin_username      = "azureuser"
    admin_password      = "Password@12345"
  }

  vm2 = {
    vm_name             = "backend-vm"
    nic_name            = "backend-vm-nic"
    public_ip_name      = "backend-vm-pip"
    location            = "CentralIndia"
    resource_group_name = "dev45"
    vnet_name           = "vnet-rg1"
    subnet_name         = "backend-subnet"
    vm_size             = "Standard_B2ats_v2"
    admin_username      = "azureuser"
    admin_password      = "Password@12345"
  }

}

