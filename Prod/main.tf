module "resource_group" {
    source = "../module/resource_group"

    resource_group_name = "rg_001"
    resource_group_location = "Central India"
}

module "virtual_network" {
    depends_on = [ module.resource_group ]
    source = "../module/virtual_network"

    virtual_network_name = "vn_001"
    resource_group_name = "rg_001"
    resource_group_location = "Central India"
    address_space = ["10.0.0.0/16"]
}

module "subnet" {
  depends_on = [ module.virtual_network ]
  source = "../module/subnet"

  subnet_name = "subnet_001"
  resource_group_name = "rg_001"
  virtual_network_name = "vn_001"
  address_prefixes = ["10.0.1.0/24"]
}

module "pip" {
    depends_on = [ module.resource_group ]
    source = "../module/public_ip"

    public_ip_name = "pip_001"
    resource_group_location = "Central India"
    resource_group_name = "rg_001"
}

module "vm" {
    depends_on = [ module.resource_group, module.virtual_network, module.subnet, module.pip ]
  source = "../module/virtual machine"

  network_interface_name = "nic_001"
  vm_name = "vm-001"
  resource_group_name = "rg_001"
  resource_group_location = "Central India"
  subnet_name = "subnet_001"
  virtual_network_name = "vn_001"
  admin_username = "devopsadmin"
  admin_password = "Devops@1234"
}