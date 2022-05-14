variable "dnsname" {}
variable "rgname" {}
variable "vnetname" {}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.97.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

resource "azurerm_private_dns_zone" "tfdns" {
  name                = var.dnsname
  resource_group_name = var.rgname
}

data "azurerm_virtual_network" "exvnet" {
  name                = var.vnetname
  resource_group_name = var.rgname
}

resource "azurerm_private_dns_zone_virtual_network_link" "vnetlink" {
  name                  = "vnetlink1"
  resource_group_name   = var.rgname
  private_dns_zone_name = azurerm_private_dns_zone.tfdns.name
  virtual_network_id    = data.azurerm_virtual_network.exvnet.id
  registration_enabled	= "true"
}
