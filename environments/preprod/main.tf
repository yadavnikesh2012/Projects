module "resource_group" {
  source = "../../modules/resource_group"
  rgs    = var.rgs
}

module "vitual_network" {
  depends_on = [module.resource_group]
  source     = "../../modules/virtual_network"
  vnets      = var.vnets

}

module "subnets" {
  depends_on = [module.vitual_network]
  source     = "../../modules/subnets"
  subnets    = var.subnets
}

module "public_ip" {
  depends_on = [module.resource_group]
  source     = "../../modules/public_ip"
  public_ips = var.public_ips
}

module "nic" {
  depends_on = [module.resource_group, module.subnets, module.public_ip]
  source = "../../modules/nic"
  nics   = var.nics
}

module "virtual_machine" {
  depends_on      = [module.subnets, module.nic, module.public_ip]
  source          = "../../modules/virtual_machine"
  virtual_machine = var.virtual_machine
}
