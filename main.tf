resource "azurerm_resource_group" "tf" {

    name        = var.resource_group_name
    location    = var.location

}

resource "azurerm_virtual_network" "tf" {
  name                  =  var.vnet_name
  resource_group_name   =  azurerm_resource_group.tf.name
  location              =  azurerm_resource_group.tf.location
  address_space         = ["${var.vnet_address}"]
  
  subnet {
    name                = var.subnet_name
    address_prefix      = var.subnet_address_prefix
  }
