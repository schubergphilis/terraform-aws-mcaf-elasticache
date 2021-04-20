output "endpoints" {
  value = try(aws_elasticache_cluster.default[0].cache_nodes.*.address,
  aws_elasticache_replication_group.default[0].primary_endpoint_address)
}

output "ports" {
  value = try(aws_elasticache_cluster.default[0].cache_nodes.*.port, var.port)
}

output "security_group_id" {
  value = aws_security_group.elasticache.id
}
