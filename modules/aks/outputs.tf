output "cluster_name" {
  description = "The name of the AKS cluster."
  value       = azurerm_kubernetes_cluster.this.name
}

output "cluster_id" {
  description = "The ID of the AKS cluster."
  value       = azurerm_kubernetes_cluster.this.id
}

output "kube_admin_config" {
  description = "Raw kubeconfig for the cluster admin."
  value       = azurerm_kubernetes_cluster.this.kube_admin_config_raw
  sensitive   = true
}

output "kube_config" {
  description = "Raw kubeconfig for regular users."
  value       = azurerm_kubernetes_cluster.this.kube_config_raw
  sensitive   = true
}
