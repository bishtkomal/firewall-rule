variable "gcp_project" {
  description = "The GCP project ID"
  type        = string
}

variable "gcp_region" {
  description = "The GCP region"
  type        = string
}

variable "network_name" {
  description = "The name of the network where the firewall will be created"
  type        = string
}

variable "firewall_rules" {
  description = "A map of firewall rules"
  type        = map(object({
    priority                = number
    allow                   = optional(list(object({
      protocol             = string
      ports                = list(string)
    })))
    deny                   = optional(list(object({
      protocol             = string
      ports                = list(string)
    })))
    source_ranges         = optional(list(string))
    source_tags           = optional(list(string))
    destination_ranges    = optional(list(string))
    target_tags           = optional(list(string))
    log_config            = object({
      metadata            = string
    })
    direction             = optional(string)
    disabled              = optional(bool)
    source_service_accounts = optional(list(string))
    target_service_accounts = optional(list(string))
    }))
}


