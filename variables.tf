variable "region" {
  description = "AWS region"
  type        = string
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "enable_dns_support" {
  description = "Enable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "instance_tenancy" {
  description = "Tenancy option for instances launched into the VPC"
  type        = string
  default     = "default"
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "main-vpc"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "endpoints" {
  description = "List of VPC endpoints"
  type        = list(string)
  default     = []
}

variable "endpoints_private_dns_enabled" {
  description = "List of private DNS enabled for endpoints"
  type        = list(bool)
  default     = []
}

variable "endpoints_security_group_ids" {
  description = "List of security group IDs for endpoints"
  type        = list(list(string))
  default     = []
}

variable "endpoints_subnet_ids" {
  description = "List of subnet IDs for endpoints"
  type        = list(list(string))
  default     = []
}

variable "endpoints_type" {
  description = "List of endpoint types"
  type        = list(string)
  default     = []
}

variable "create_subnets" {
  description = "Flag to create subnets automatically"
  type        = bool
  default     = true
}

variable "create_internet_gateway" {
  description = "Flag to create an Internet Gateway"
  type        = bool
  default     = true
}

variable "create_nat_gateway" {
  description = "Flag to create NAT Gateway"
  type        = bool
  default     = false
}

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDR blocks if manually creating subnets"
  type        = list(string)
  default     = []
}

variable "private_subnet_cidrs" {
  description = "List of private subnet CIDR blocks if manually creating subnets"
  type        = list(string)
  default     = []
}
