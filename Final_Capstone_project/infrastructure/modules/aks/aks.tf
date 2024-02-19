
resource "azurerm_kubernetes_cluster" "capstone_k8s" {
  name                = "uneku-capstone-k8s"
  location            = var.rg_location
  resource_group_name = var.rg_name
  dns_prefix          = "uneku-capstone-k8s"

  default_node_pool {
    name           = "system"
    node_count     = 2
    vm_size        = "Standard_B2s"
    vnet_subnet_id = var.capstone_subnet_id
  }

  network_profile {
    network_plugin    = "azure"
    network_policy    = "calico"
    load_balancer_sku = "standard"
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "user" {
  name                  = "user"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.capstone_k8s.id
  vm_size               = "Standard_B2s"
  node_count            = 2
  vnet_subnet_id        = var.capstone_subnet_id
}
