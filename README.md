<!-- markdownlint-disable -->
<p align="center">
    <a href="https://github.com/TerraformToolbox/">
        <img src="https://cdn.wolfsoftware.com/assets/images/github/organisations/terraformtoolbox/black-and-white-circle-256.png" alt="TerraformToolbox logo" />
    </a>
    <br />
    <a href="https://github.com/TerraformToolbox/terraform-aws-vpc/actions/workflows/cicd.yml">
        <img src="https://img.shields.io/github/actions/workflow/status/TerraformToolbox/terraform-aws-vpc/cicd.yml?branch=master&label=build%20status&style=for-the-badge" alt="Github Build Status" />
    </a>
    <a href="https://github.com/TerraformToolbox/terraform-aws-vpc/blob/master/LICENSE.md">
        <img src="https://img.shields.io/github/license/TerraformToolbox/terraform-aws-vpc?color=blue&label=License&style=for-the-badge" alt="License">
    </a>
    <a href="https://github.com/TerraformToolbox/terraform-aws-vpc">
        <img src="https://img.shields.io/github/created-at/TerraformToolbox/terraform-aws-vpc?color=blue&label=Created&style=for-the-badge" alt="Created">
    </a>
    <br />
    <a href="https://github.com/TerraformToolbox/terraform-aws-vpc/releases/latest">
        <img src="https://img.shields.io/github/v/release/TerraformToolbox/terraform-aws-vpc?color=blue&label=Latest%20Release&style=for-the-badge" alt="Release">
    </a>
    <a href="https://github.com/TerraformToolbox/terraform-aws-vpc/releases/latest">
        <img src="https://img.shields.io/github/release-date/TerraformToolbox/terraform-aws-vpc?color=blue&label=Released&style=for-the-badge" alt="Released">
    </a>
    <a href="https://github.com/TerraformToolbox/terraform-aws-vpc/releases/latest">
        <img src="https://img.shields.io/github/commits-since/TerraformToolbox/terraform-aws-vpc/latest.svg?color=blue&style=for-the-badge" alt="Commits since release">
    </a>
    <br />
    <a href="https://github.com/TerraformToolbox/terraform-aws-vpc/blob/master/.github/CODE_OF_CONDUCT.md">
        <img src="https://img.shields.io/badge/Code%20of%20Conduct-blue?style=for-the-badge" />
    </a>
    <a href="https://github.com/TerraformToolbox/terraform-aws-vpc/blob/master/.github/CONTRIBUTING.md">
        <img src="https://img.shields.io/badge/Contributing-blue?style=for-the-badge" />
    </a>
    <a href="https://github.com/TerraformToolbox/terraform-aws-vpc/blob/master/.github/SECURITY.md">
        <img src="https://img.shields.io/badge/Report%20Security%20Concern-blue?style=for-the-badge" />
    </a>
    <a href="https://github.com/TerraformToolbox/terraform-aws-vpc/issues">
        <img src="https://img.shields.io/badge/Get%20Support-blue?style=for-the-badge" />
    </a>
</p>

## Overview

A Terraform module for creating an AWS VPC with options to create public and private subnets, NAT gateways, and Internet gateways.

## Usage

### Minimal Usage

```
module "vpc" {
  source      = "https://github.com/TerraformToolbox/terraform-aws-vpc"
  region      = "us-west-2"
  cidr_block  = "10.0.0.0/16"
  vpc_name    = "my-vpc"
}
```

### All Options

```
module "vpc" {
  source = "https://github.com/TerraformToolbox/terraform-aws-vpc"

  region                        = "us-west-2"
  cidr_block                    = "10.0.0.0/16"
  enable_dns_support            = true
  enable_dns_hostnames          = true
  instance_tenancy              = "default"
  vpc_name                      = "my-vpc"
  tags                          = { "Environment" = "dev" }

  create_subnets                = true
  create_internet_gateway       = true
  create_nat_gateway            = true
  public_subnet_cidrs           = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs          = ["10.0.3.0/24", "10.0.4.0/24"]

  endpoints                     = ["com.amazonaws.us-west-2.s3", "com.amazonaws.us-west-2.dynamodb"]
  endpoints_private_dns_enabled = [true, false]
  endpoints_security_group_ids  = [["sg-12345678"], ["sg-87654321"]]
  endpoints_subnet_ids          = [["subnet-1234abcd"], ["subnet-abcd1234"]]
  endpoints_type                = ["Gateway", "Interface"]
}
```

## Inputs

- `region`: AWS region
- `cidr_block`: CIDR block for the VPC
- `enable_dns_support`: Enable DNS support in the VPC
- `enable_dns_hostnames`: Enable DNS hostnames in the VPC
- `instance_tenancy`: Tenancy option for instances launched into the VPC
- `vpc_name`: Name of the VPC
- `tags`: A map of tags to add to all resources
- `endpoints`: List of VPC endpoints
- `endpoints_private_dns_enabled`: List of private DNS enabled for endpoints
- `endpoints_security_group_ids`: List of security group IDs for endpoints
- `endpoints_subnet_ids`: List of subnet IDs for endpoints
- `endpoints_type`: List of endpoint types
- `create_subnets`: Flag to create subnets automatically
- `create_internet_gateway`: Flag to create an Internet Gateway
- `create_nat_gateway`: Flag to create NAT Gateway
- `public_subnet_cidrs`: List of public subnet CIDR blocks if manually creating subnets
- `private_subnet_cidrs`: List of private subnet CIDR blocks if manually creating subnets

## Outputs

- `vpc_id`: The ID of the VPC
- `vpc_arn`: The ARN of the VPC
- `vpc_cidr_block`: The CIDR block of the VPC
- `vpc_default_network_acl_id`: The ID of the default network ACL
- `vpc_default_route_table_id`: The ID of the default route table
- `vpc_default_security_group_id`: The ID of the default security group
- `vpc_main_route_table_id`: The ID of the main route table
- `public_subnet_ids`: The IDs of the public subnets
- `public_subnet_cidr_blocks`: The CIDR blocks of the public subnets
- `private_subnet_ids`: The IDs of the private subnets
- `private_subnet_cidr_blocks`: The CIDR blocks of the private subnets
- `internet_gateway_id`: The ID of the Internet Gateway
- `nat_gateway_ids`: The IDs of the NAT Gateways
- `nat_gateway_ips`: The Elastic IPs of the NAT Gateways
- `public_route_table_id`: The ID of the public route table
- `private_route_table_id`: The ID of the private route table
- `vpc_endpoints`: The IDs of the VPC endpoints

<br />
<p align="right"><a href="https://wolfsoftware.com/"><img src="https://img.shields.io/badge/Created%20by%20Wolf%20on%20behalf%20of%20Wolf%20Software-blue?style=for-the-badge" /></a></p>
