variable "cluster_name" {
  description = "The name of the AKS cluster."
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

variable "subnet_id" {
  description = "ID of the subnet for the AKS node pool."
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version for the AKS cluster."
  type        = string
}

variable "service_mesh_internal_ingress_enabled" {
  description = "Whether to enable the internal Istio ingress gateway."
  type        = bool
}

variable "node_pool_name" {
  description = "Name of the default node pool."
  type        = string
  default     = "default"
}

variable "node_pool_vm_size" {
  description = "VM size for the default node pool."
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

variable "api_server_authorized_ip_ranges" {
  description = "Authorized IP ranges for API server access."
  type        = list(string)
}
