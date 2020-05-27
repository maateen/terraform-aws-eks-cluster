data "aws_vpc" "cluster_vpc" {
  tags = {
    Name = var.vpc_name
  }
}

data "aws_subnet_ids" "cluster_subnets" {
  vpc_id = data.aws_vpc.cluster_vpc.id
}

module "k8s_cluster" {
  source                          = "terraform-aws-modules/eks/aws"
  version                         = "12.0.0"
  cluster_name                    = var.cluster_name
  cluster_version                 = var.cluster_version
  vpc_id                          = data.aws_vpc.cluster_vpc.id
  subnets                         = data.aws_subnet_ids.cluster_subnets.ids
  cluster_endpoint_private_access = var.cluster_endpoint_private_access
  cluster_endpoint_public_access  = var.cluster_endpoint_public_access

  worker_groups = [
    {
      name                 = "on-demand-1"
      instance_type        = "m4.large"
      asg_max_size         = 1
      asg_min_size         = 1
      asg_desired_capacity = 1
      root_volume_size     = 100
      root_volume_type     = "gp2"
      root_iops            = 0
      bootstrap_extra_args = var.bootstrap_extra_args
      kubelet_extra_args   = var.kubelet_extra_args
    }
  ]

  tags = {
    Name        = var.cluster_name
    Environment = var.environment
  }
}
