resource "azurerm_kubernetes_cluster" "this" {
  name                = var.cluster_name
  dns_prefix          = var.dns_prefix
  location            = var.location
  resource_group_name = var.resource_group_name

  kubernetes_version        = var.kubernetes_version
  automatic_upgrade_channel = var.upgrade_channel
  sku_tier                  = var.sku_tier
  oidc_issuer_enabled       = var.oidc_issuer_enabled
  workload_identity_enabled = var.workload_identity_enabled

  service_mesh_profile {
    mode                             = var.service_mesh_mode
    revisions                        = var.service_mesh_revisions
    internal_ingress_gateway_enabled = var.service_mesh_internal_ingress_enabled
  }

  network_profile {
    network_plugin      = var.network_plugin
    network_policy      = var.network_policy
    network_plugin_mode = var.network_plugin_mode

    load_balancer_profile {
      managed_outbound_ip_count = var.managed_outbound_ip_count
      idle_timeout_in_minutes   = var.idle_timeout_in_minutes
    }
  }

  default_node_pool {
    name                        = var.node_pool_name
    temporary_name_for_rotation = var.node_pool_temp_name
    vm_size                     = var.node_pool_vm_size
    vnet_subnet_id              = var.subnet_id
    os_disk_size_gb             = var.os_disk_size_gb

    node_count           = var.node_count

    upgrade_settings {
      drain_timeout_in_minutes      = var.node_pool_drain_timeout
      max_surge                     = var.node_pool_max_surge
      node_soak_duration_in_minutes = var.node_pool_soak_duration
    }
  }

  auto_scaler_profile {
    scale_down_delay_after_add = var.scale_down_delay
    scan_interval              = var.scan_interval
  }

  api_server_access_profile {
    authorized_ip_ranges = var.api_server_authorized_ip_ranges
  }

  key_vault_secrets_provider {
    secret_rotation_enabled = var.secret_rotation_enabled
  }

  identity {
    type = var.identity_type
  }
}