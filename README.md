## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |
| aws | ~> 2.0 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| additional\_tags | Additional tags to apply to node group | `map` | <pre>{<br>  "k8s.io/cluster-autoscaler/enabled": true,<br>  "k8s.io/cluster-autoscaler/peacock": true<br>}</pre> | no |
| asg\_desired\_capacity | Desired worker capacity in the autoscaling group and changing its value will not affect the autoscaling group's desired capacity because the cluster-autoscaler manages up and down scaling of the nodes. Cluster-autoscaler add nodes when pods are in pending state and remove the nodes when they are not required by modifying the desirec\_capacity of the autoscaling group. Although an issue exists in which if the value of the asg\_min\_size is changed it modifies the value of asg\_desired\_capacity. | `number` | `1` | no |
| asg\_max\_size | Maximum worker capacity in the autoscaling group. | `number` | `1` | no |
| asg\_min\_size | Minimum worker capacity in the autoscaling group. NOTE: Change in this paramater will affect the asg\_desired\_capacity, like changing its value to 2 will change asg\_desired\_capacity value to 2 but bringing back it to 1 will not affect the asg\_desired\_capacity. | `number` | `1` | no |
| bootstrap\_extra\_args | Extra arguments passed to the bootstrap.sh script from the EKS AMI (Amazon Machine Image). | `string` | `"--enable-docker-bridge true"` | no |
| cluster\_endpoint\_private\_access | Indicates whether or not the Amazon EKS private API server endpoint is enabled. | `bool` | `true` | no |
| cluster\_endpoint\_public\_access | Indicates whether or not the Amazon EKS public API server endpoint is enabled. | `bool` | `false` | no |
| cluster\_name | Name of the EKS cluster. Also used as a prefix in names of related resources. | `string` | `"peacock"` | no |
| cluster\_version | Kubernetes version to use for the EKS cluster. | `string` | `"1.16"` | no |
| environment | The environment type of your cluster. | `string` | `"production"` | no |
| iam\_path | If provided, all IAM roles will be created on this path. | `string` | `"/"` | no |
| kubeconfig\_path | Where to save the Kubectl config file. | `string` | `"~/.kube/config"` | no |
| kubelet\_extra\_args | This string is passed directly to kubelet if set. Useful for adding labels or taints. | `string` | `"--node-labels=node.kubernetes.io/lifecycle=normal"` | no |
| region | The AWS region you'd like to deploy the cluster in. | `string` | `"us-east-1"` | no |
| root\_iops | The amount of provisioned IOPS. This must be set with a volume\_type of 'io1'. | `number` | `0` | no |
| root\_volume\_size | Root volume size of workers instances. | `number` | `100` | no |
| root\_volume\_type | Root volume type of workers instances, can be 'standard', 'gp2', or 'io1' | `string` | `"gp2"` | no |
| vpc\_name | VPC where the cluster and workers will be deployed. | `string` | `"default"` | no |
| write\_kubeconfig | Whether to write a Kubectl config file containing the cluster configuration. | `bool` | `true` | no |

## Outputs

No output.

