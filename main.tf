resource "aws_elasticache_subnet_group" "default" {
  name       = var.name
  subnet_ids = var.private_subnet_ids
}

resource "aws_elasticache_cluster" "default" {
  cluster_id           = var.name
  engine               = var.engine
  node_type            = var.node_type
  num_cache_nodes      = 1
  subnet_group_name    = aws_elasticache_subnet_group.default.name
  security_group_ids   = [aws_security_group.elasticache.id]
  parameter_group_name = var.parameter_group_name
  engine_version       = var.engine_version
  port                 = 6379
  tags                 = var.tags
}

resource "aws_security_group" "elasticache" {
  name        = "${var.name}-elasticache"
  description = "Security group for the ${var.name} elasticache cluster"
  vpc_id      = var.vpc_id
  tags        = var.tags

  ingress {
    from_port       = 6379
    to_port         = 6379
    security_groups = var.allowed_security_group_ids
    protocol        = "tcp"
  }
}
