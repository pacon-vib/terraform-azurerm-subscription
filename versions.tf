terraform {
  required_version = ">= 0.13"
  required_providers {
    azurerm = "~> 2.19"
    shell = {
      source  = "scottwinkler/shell"
      version = "=1.7.2"
    }
  }
}
