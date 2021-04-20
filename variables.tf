variable "allowed_cidrs" {
  type        = list(string)
  default     = []
  description = "Allow these CIDRs to the resources created in this module"
}

variable "allowed_security_group_ids" {
  type        = list(string)
  default     = []
  description = "Allow these security groups to the resources created in this module"
}

variable "at_rest_encryption" {
  type        = bool
  default     = null
  description = "If set it will enable encryption of the data while stored"
}

variable "auth_token" {
  type        = string
  default     = null
  description = "Password used to access a password protected server"
}

variable "availability_zones" {
  type        = list(string)
  default     = null
  description = "The availability zones to place the cache nodes"
}

variable "engine" {
  type        = string
  default     = "redis"
  description = "Engine to use in the elasticache cluster"
}

variable "engine_version" {
  type        = string
  default     = "6.x"
  description = "Engine version to use in the elasticache cluster"
}

variable "in_transit_encryption" {
  type        = bool
  default     = null
  description = "If set it will enable SSL between client and server"
}

variable "kms_key_arn" {
  type        = string
  default     = null
  description = "The KMS key ARN used for the at-rest encryption"
}

variable "name" {
  type        = string
  description = "The name of the elasticache cluster"
}

variable "node_type" {
  type        = string
  default     = "cache.t2.small"
  description = "The node type to use for the instances"
}

variable "num_cache_nodes" {
  type        = number
  default     = 1
  description = "The number of nodes to use in the elasticache cluster"
}

variable "parameter_group_name" {
  type        = string
  default     = "default.redis6.x"
  description = "The parameter group to use for the elasticache cluster"
}

variable "port" {
  type        = number
  default     = 6379
  description = "The port to use for the elasticache cluster"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "The private subnets of the VPC"
}

variable "replication_group" {
  type        = bool
  default     = false
  description = "Creates a replication group instead of a single-node instance"
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resources"
}

variable "vpc_id" {
  type        = string
  description = "The VPC ID"
}
