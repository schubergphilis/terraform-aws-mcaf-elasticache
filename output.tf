output "security_group_id" {
  value = aws_security_group.elasticache.id
}

output "endpoints" {
  value = aws_elasticache_cluster.default.cache_nodes.*.address
}

}
