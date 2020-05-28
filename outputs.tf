output "cluster_endpoint" {
  description = "The endpoint for your EKS Kubernetes API."
  value       = module.k8s_cluster.cluster_endpoint
}
