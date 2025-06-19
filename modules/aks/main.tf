resource "azurerm_kubernetes_cluster" "this" {
  name                = var.cluster_name
  dns_prefix          = "${var.cluster_name}-dns"
  location            = var.location
  resource_group_name = var.resource_group_name

  kubernetes_version        = var.kubernetes_version
  automatic_upgrade_channel = "patch"
  sku_tier                  = "Standard"
  oidc_issuer_enabled       = true
  workload_identity_enabled = true

  service_mesh_profile {
    mode                             = "Istio"
    revisions                        = ["asm-1-25"]
    internal_ingress_gateway_enabled = var.service_mesh_internal_ingress_enabled
  }

  network_profile {
    network_plugin      = "azure"
    network_policy      = "azure"
    network_plugin_mode = "overlay"

    load_balancer_profile {
      managed_outbound_ip_count = 2
      idle_timeout_in_minutes   = 15
    }
  }

  default_node_pool {
    name                        = var.node_pool_name
    temporary_name_for_rotation = "temp${var.node_pool_name}"
    vm_size                     = var.node_pool_vm_size
    vnet_subnet_id              = var.subnet_id
    os_disk_size_gb             = var.os_disk_size_gb

    node_count = var.node_count

    upgrade_settings {
      drain_timeout_in_minutes      = 5
      max_surge                     = "33%"
      node_soak_duration_in_minutes = 0
    }
  }

  auto_scaler_profile {
    scale_down_delay_after_add = "15m"
    scan_interval              = "10s"
  }

  api_server_access_profile {
    authorized_ip_ranges = var.api_server_authorized_ip_ranges
  }

  key_vault_secrets_provider {
    secret_rotation_enabled = true
  }

  identity {
    type = "SystemAssigned"
  }
}