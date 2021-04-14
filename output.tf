output "primary_endpoints" {
  value = var.replication_group ? aws_elasticache_replication_group.default[0].primary_endpoint_address : aws_elasticache_cluster.default[0].cache_nodes.*.address
}

output "security_group_id" {
  value = aws_security_group.elasticache.id
}
