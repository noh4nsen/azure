variable "cluster_name" {
  description = "The name of the AKS cluster."
  type        = string
}

variable "dns_prefix" {
  description = "The DNS prefix for the AKS cluster FQDN."
  type        = string
}

variable "location" {
  description = "Azure region where AKS cluster will be deployed."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group in which to create the AKS cluster."
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version for the AKS cluster."
  type        = string
}

variable "upgrade_channel" {
  description = "Automatic upgrade channel for AKS cluster."
  type        = string
  validation {
    condition     = contains(["none", "patch", "rapid", "stable"], var.upgrade_channel)
    error_message = "upgrade_channel must be one of: none, patch, rapid, stable."
  }
}

variable "sku_tier" {
  description = "The SKU tier for AKS (e.g., Free, Standard)."
  type        = string
}

variable "oidc_issuer_enabled" {
  description = "Enable OIDC issuer for AKS cluster."
  type        = bool
  default     = true
}

variable "workload_identity_enabled" {
  description = "Enable workload identity for AKS cluster."
  type        = bool
  default     = true
}

variable "service_mesh_mode" {
  description = "Service mesh mode, e.g., Istio."
  type        = string
}

variable "service_mesh_revisions" {
  description = "List of Istio control plane revisions to use."
  type        = list(string)
}

variable "service_mesh_internal_ingress_enabled" {
  description = "Whether to enable the internal Istio ingress gateway."
  type        = bool
}

variable "network_plugin" {
  description = "Network plugin for AKS (azure or kubenet)."
  type        = string
}

variable "network_policy" {
  description = "Network policy for AKS (azure or calico)."
  type        = string
}

variable "network_plugin_mode" {
  description = "Network plugin mode, e.g., overlay."
  type        = string
}

variable "managed_outbound_ip_count" {
  description = "Number of managed outbound IPs for the load balancer."
  type        = number
  default     = 1
}

variable "idle_timeout_in_minutes" {
  description = "Idle timeout for load balancer outbound connections."
  type        = number
  default     = 15
}

variable "node_pool_name" {
  description = "Name of the default node pool."
  type        = string
  default     = "default"
}

variable "node_pool_temp_name" {
  description = "Temporary name for node pool during rotation."
  type        = string
}

variable "node_pool_vm_size" {
  description = "VM size for the default node pool."
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet for the AKS node pool."
  type        = string
}

variable "os_disk_size_gb" {
  description = "OS disk size in GB for node pool VMs."
  type        = number
  default     = 128
}

variable "node_count" {
  description = "Number of nodes in the default node pool."
  type        = number
}

variable "node_pool_drain_timeout" {
  description = "Drain timeout in minutes during node upgrade."
  type        = number
  default     = 5
}

variable "node_pool_max_surge" {
  description = "Maximum surge for node upgrades (e.g., 33%)."
  type        = string
}

variable "node_pool_soak_duration" {
  description = "Node soak duration in minutes before upgrade."
  type        = number
  default     = 0
}

variable "scale_down_delay" {
  description = "Delay after scale up before scale down."
  type        = string
}

variable "scan_interval" {
  description = "Interval for auto-scaler scan."
  type        = string
}

variable "api_server_authorized_ip_ranges" {
  description = "Authorized IP ranges for API server access."
  type        = list(string)
}

variable "secret_rotation_enabled" {
  description = "Enable secret rotation for Key Vault provider."
  type        = bool
  default     = false
}

variable "identity_type" {
  description = "Type of identity for AKS (SystemAssigned, UserAssigned)."
  type        = string
}