
variable "client_id" {
   
}
variable "client_secret" {
    
}
variable "tenant_id" {
    
}
variable "subscription_id" {
    
}

variable "resource_group_name" {
    default = "tf_rg"

}
variable "location" {
    default = "southcentralus"
  
}

variable "vnet_name" {
    default = "tfVnet"
}
variable "vnet_address" {
    default = "10.20.0.0/16"
}
variable "subnet_name" {
    default = "tfsubnet1"
}
variable "subnet_address_prefix" {
    default = "10.20.0.0/25"
}
