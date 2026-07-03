output "cluster_arn" {
  value = aws_ecs_cluster.this.arn
}

output "distribution_domain" {
  value = aws_cloudfront_distribution.this.domain_name
}

output "listener_arn" {
  value = aws_lb_listener.http.arn
}

module "cluster" {
  source = "../cluster"

  security_groups = [module.network.private_security_group]
  subnets         = module.network.private_subnets
  name            = var.name
  vpc_id          = module.network.vpc_id

  capacity_providers = {
    "spot" = {
      instance_type = "t3a.medium"
      market_type   = "spot"
    }
  }
}
