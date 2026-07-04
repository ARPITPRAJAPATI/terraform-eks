module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name               = local.name
  cluster_version = "1.33"

  cluster_endpoint_public_access = true

  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.private_subnets
  control_plane_subnet_ids = module.vpc.intra_subnets

  eks_managed_node_group_defaults = {
    instance_types                = ["t3.medium"]
    attach_primary_security_group = true
  }

  eks_managed_node_groups = {
    arush-cluster-ng = {
        instance_types = ["t3.medium"]

        min_size =2 
        max_size = 3
        desired_size = 2
        capacity_type = "SPOT"
    }
  }
  cluster_addons = {
        vpc-cni = {
            most_recent = true
        }
        kube-proxy ={
            most_recent = true
        }
        coredns ={
            most_recent = true
        }
    }
  tags ={
    Environment = local.env
    Terraform = "true"
  }
}