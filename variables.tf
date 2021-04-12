variable "availability_zones" {
  type        = list(string)
  default     = []
  description = "The availability zones to place the cache nodes"
}

variable "at_rest_encryption" {
  type        = bool
  default     = false
  description = "If set it will enable encryption of the data while stored"
}

variable "allowed_security_group_ids" {
  type        = list(string)
  default     = []
  description = "Allow these security groups to the resources created in this module"
}

variable "allowed_cidrs" {
  type        = list(string)
  default     = []
  description = "Allow these CIDRs to the resources created in this module"
}

variable "engine" {
  type        = string
  default     = "redis"
  description = "Engine to use in the elasticache cluster"
}

variable "engine_version" {
  type        = string
  default     = "5.0.6"
  description = "Engine version to use in the elasticache cluster"
}

variable "in_transit_encryption" {
  type        = bool
  default     = false
  description = "If set it will enable SSL between client and server"
}

variable "kms_key_id" {
  type        = string
  default     = null
  description = "The KMS key ID used for the at-rest encryption"
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

variable "auth_token" {
  type        = string
  description = "The auth_token when using in-transit encryption"
}

variable "parameter_group_name" {
  type        = string
  default     = "default.redis5.0"
  description = "The parameter group to use for the elasticache cluster"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "The private subnets of the VPC"
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resources"
}

variable "vpc_id" {
  type        = string
  description = "The VPC ID"
}
