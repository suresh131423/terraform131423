#-- to maintain state
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.69.0"
    }
  } 
  #  backend "azurerm" {}
  #  required_version = ">= 0.13"
}

locals {
  tags = {
    Customer           = var.customer
    BusinessUnit       = var.business_unit
    ApplicationName    = var.applicationname
    DataClassification = var.data_classification
    ApproverName       = var.approver_name
    Environment        = var.environment
    Contact            = var.contact
    region             = var.region
    environment_short  = var.environment_short

  }
}

module "azurerm_rg_transit" {
  source   ="../resources/ResourceGroup_module"
  name     = lower(join("-", ["rg", var.region, var.business_unit, var.environment_short, var.resource_group]))
  location = var.location

  tags = merge(
    local.tags,
    {
      "Name" = lower(join("-", ["rg", var.region, var.business_unit, var.environment_short, var.environment]))
    }
  )
  
}


module "azurerm_vnet_transit" {
  source                  = "../resources/VNet_module"
  resource_group_name     = module.azurerm_rg_transit.resource_group_name
  name                    = lower(join("-", ["vnet", var.region, var.business_unit, var.environment_short, var.resource_group]))
  addressSpace            = var.vnet_transit_addressspace
  
  depends_on              = [module.azurerm_rg_transit]

  tags = merge(
    local.tags,
    {
      "Name" = lower(join("-", ["vnet", var.region, var.business_unit, var.environment_short, var.environment]))
    }
  )

}