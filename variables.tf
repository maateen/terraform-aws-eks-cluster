variable "region" {
  description = "The AWS region you'd like to deploy the cluster in."
  default     = "us-east-1"
}

variable "environment" {
  description = "The environment type of your cluster."
  default     = "production"
}

variable "vpc_name" {
  description = "VPC where the cluster and workers will be deployed."
  default     = "default"
}

variable "cluster_name" {
  description = "Name of the EKS cluster. Also used as a prefix in names of related resources."
  default     = "peacock"
}

variable "cluster_version" {
  description = "Kubernetes version to use for the EKS cluster."
  default     = "1.16"
}

variable "cluster_endpoint_private_access" {
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled."
  default     = true
}

variable "cluster_endpoint_public_access" {
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled."
  default     = false
}

variable "asg_max_size" {
  description = "Maximum worker capacity in the autoscaling group."
  default     = 1
}

variable "asg_min_size" {
  description = "Minimum worker capacity in the autoscaling group. NOTE: Change in this paramater will affect the asg_desired_capacity, like changing its value to 2 will change asg_desired_capacity value to 2 but bringing back it to 1 will not affect the asg_desired_capacity."
  default     = 1
}

variable "asg_desired_capacity" {
  description = "Desired worker capacity in the autoscaling group and changing its value will not affect the autoscaling group's desired capacity because the cluster-autoscaler manages up and down scaling of the nodes. Cluster-autoscaler add nodes when pods are in pending state and remove the nodes when they are not required by modifying the desirec_capacity of the autoscaling group. Although an issue exists in which if the value of the asg_min_size is changed it modifies the value of asg_desired_capacity."
  default     = 1
}

variable "root_volume_size" {
  description = "Root volume size of workers instances."
  default     = 100
}

variable "root_volume_type" {
  description = "Root volume type of workers instances, can be 'standard', 'gp2', or 'io1'"
  default     = "gp2"
}

variable "root_iops" {
  description = "The amount of provisioned IOPS. This must be set with a volume_type of 'io1'."
  default     = 0
}

variable "bootstrap_extra_args" {
  description = "Extra arguments passed to the bootstrap.sh script from the EKS AMI (Amazon Machine Image)."
  default     = "--enable-docker-bridge true"
}

variable "kubelet_extra_args" {
  description = "This string is passed directly to kubelet if set. Useful for adding labels or taints."
  default     = "--node-labels=node.kubernetes.io/lifecycle=normal"
}

variable "iam_path" {
  description = "If provided, all IAM roles will be created on this path."
  default     = "/"
}

variable "write_kubeconfig" {
  description = "Whether to write a Kubectl config file containing the cluster configuration."
  default     = true
}

variable "kubeconfig_path" {
  description = "Where to save the Kubectl config file."
  default     = "~/.kube/config"
}

variable "additional_tags" {
  description = "Additional tags to apply to node group"
  default = {
    "k8s.io/cluster-autoscaler/enabled" = true
    "k8s.io/cluster-autoscaler/peacock" = true
  }
}
