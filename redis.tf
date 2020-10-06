resource "aws_elasticache_replication_group" "default" {
  replication_group_id          = var.elasticache_cluster_name
  replication_group_description = var.elasticache_cluster_description
  node_type                     = "cache.t2.small"
  port                          = 3389
  parameter_group_name          = "default.redis3.2.cluster.on"
  automatic_failover_enabled    = true

  cluster_mode {
    replicas_per_node_group = 1
    num_node_groups         = 2
  }
}