# terraform-aws-mcaf-elasticache

## Cluster or Replication Group
This module creates either a `aws_elasticache_cluster` or a `aws_elasticache_replication_group` 
depending on the `replication_group` variable. Only a `aws_elasticache_replication_group` can use a encryption
at-rest and in-transit. 
