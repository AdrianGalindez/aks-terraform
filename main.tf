provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-aks-tf-demo"
  location = "eastus"   # cambia según preferencia
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-tf-demo"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "aks-tf-demo"

  default_node_pool {
    name       = "agentpool"
    node_count = 2
    vm_size = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
  }
}

