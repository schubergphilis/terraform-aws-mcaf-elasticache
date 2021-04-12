output "primary_endpoints" {
  value = var.num_cache_nodes == 1 ? aws_elasticache_cluster.default[0].cache_nodes.*.address : aws_elasticache_replication_group.default[0].primary_endpoint_address
}

output "reader_endpoints" {
  value = var.num_cache_nodes > 1 ? aws_elasticache_replication_group.default[0].reader_endpoint_address : null
}

output "security_group_id" {
  value = aws_security_group.elasticache.id
}
