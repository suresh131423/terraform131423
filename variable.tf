variable "virtual_network" {}

variable "resource_group" {}

variable "location" {}

variable "region" {
  
}

variable "vnet_transit_addressspace" {}



variable "environment_short" {
  default = ""
}



###################################################
# TAGs
###################################################

variable "customer" {
  type = string
}

variable "environment" {
  type = string
}

variable "business_unit" {
  type = string
}

variable "applicationname" {
  type = string
}

variable "applicationname_short" {
  type = string
}

variable "approver_name" {
  type = string
}

variable "owner_name" {
  type = string
}

variable "data_classification" {
  type = string
}

variable "contact" {
  type = string
}


