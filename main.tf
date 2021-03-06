resource "aws_elasticache_subnet_group" "default" {
  name       = var.name
  subnet_ids = var.private_subnet_ids
}

resource "aws_elasticache_cluster" "default" {
  count = var.replication_group ? 0 : 1

  cluster_id           = var.name
  engine               = var.engine
  node_type            = var.node_type
  num_cache_nodes      = var.num_cache_nodes
  subnet_group_name    = aws_elasticache_subnet_group.default.name
  security_group_ids   = [aws_security_group.elasticache.id]
  parameter_group_name = var.parameter_group_name
  engine_version       = var.engine_version
  port                 = var.port
  tags                 = var.tags

  lifecycle {
    ignore_changes = [engine_version]
  }
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

  ingress {
    from_port   = 6379
    to_port     = 6379
    cidr_blocks = var.allowed_cidrs
    protocol    = "tcp"
  }
}

resource "aws_elasticache_replication_group" "default" {
  count = var.replication_group ? 1 : 0

  at_rest_encryption_enabled    = var.at_rest_encryption
  auth_token                    = var.auth_token
  auto_minor_version_upgrade    = true
  automatic_failover_enabled    = var.num_cache_nodes > 1
  availability_zones            = var.availability_zones
  engine                        = var.engine
  engine_version                = var.engine_version
  kms_key_id                    = var.kms_key_arn
  node_type                     = var.node_type
  number_cache_clusters         = var.num_cache_nodes
  parameter_group_name          = "default.${var.engine}${var.engine_version}"
  port                          = var.port
  replication_group_description = "${var.name} replication group."
  replication_group_id          = "${var.name}-replication-group"
  security_group_ids            = [aws_security_group.elasticache.id]
  subnet_group_name             = aws_elasticache_subnet_group.default.name
  tags                          = var.tags
  transit_encryption_enabled    = var.in_transit_encryption

  lifecycle {
    ignore_changes = [engine_version]
  }
}
