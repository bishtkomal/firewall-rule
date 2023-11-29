#  GCP Firewall Module - Terraform Configuration

## Overview

This Terraform module is designed to create, update, and manage firewall rules within a Google Cloud Platform (GCP) environment. It provides a flexible way to define a variety of firewall rules, including ingress and egress rules, allowing for granular control over network traffic.

## Requirements

Terraform >= 1.0.0
GCP Provider ~> 3.5

## Usage
### Module Configuration

To use this module, include it in your *main.tf* file with the required input variables.
```terraform
module "gcp_firewall" {
  source         = "./firewall-module"
  network_name   = var.network_name
  firewall_rules = var.firewall_rules
}
```

### Provider Configuration

Set up your GCP provider in *provider.tf*.

```terraform
provider "google" {
  project = var.gcp_project
  region  = var.gcp_region
}
```

### Input Variables

Define these variables in your *variables.tf* and *terraform.tfvars* files.

- gcp_project: The GCP project ID.
- gcp_region: The GCP region.
- network_name: The name of the network where the firewall will be created.
- firewall_rules: A map of firewall rules.
- Firewall Rule Structure

Each firewall rule is a map with the following attributes:

- priority: Rule priority (number).
- allow: List of objects for allowed protocols and ports.
- deny: List of objects for denied protocols and ports.
- source_ranges: CIDR ranges for source (optional).
- source_tags: Source tags (optional).
- destination_ranges: CIDR ranges for destination (optional).
- target_tags: Target tags (optional).
- log_config: Logging configuration.
- direction: Rule direction ("INGRESS" or "EGRESS").
- disabled: Flag to disable the rule (optional).
- source_service_accounts: Source service accounts (optional).
- target_service_accounts: Target service accounts (optional).

### Example *firewall_rules*

```terraform
firewall_rules = {
  "firewall-rule-example" = {
    priority = 1000
    allow = [{
      protocol = "tcp"
      ports    = ["80", "443"]
    }]
    // Other optional fields...
  }
  // Additional rules...
}

```

## Modifying and Creating New Rules

To modify existing rules or add new ones, update the firewall_rules map in the *terraform.tfvars* file. 
Ensure that each rule has a unique key within the map.

## Avoiding Common Mistakes

- Do not overlap CIDR ranges in source and destination ranges to prevent conflicts.
- Ensure the priority of each rule is unique.
- Avoid using overly broad ranges in source_ranges and destination_ranges for security.

## Changing Module Path
Keep in check to update the path of the module in *main.tf*, update the source attribute in the module configuration:

```terraform
module "gcp_firewall" {
  source = "<new-path-to-module>"
  // Other configurations...
}
```

## Outputs

The module does not explicitly define outputs. However, outputs can be added as per specific requirements.

## Conclusion

This Terraform module provides a robust and flexible way to manage firewall rules in GCP, offering extensive customization to fit various security and networking needs.


