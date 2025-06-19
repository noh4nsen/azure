variable "resource_group_name" {
  type        = string
  description = "Existing RG where the network will live."
}

variable "location" {
  type        = string
  description = "Azure region (e.g. eastus2)."
}

variable "vnet_name" {
  type        = string
  description = "Name of the virtual network."
}

variable "address_space" {
  type        = list(string)
  description = "Address CIDR blocks for the VNet."
}

variable "subnets" {
  description = <<EOF
Map whose keys are subnet names.  
Value is an object with:
  * address_prefixes   — list(string) (required)  
  * nsg_id             — string (optional)  
  * service_endpoints  — list(string) (optional)  
  * delegations        — list(object({ name = string, service = string })) (optional)
EOF
  type = map(object({
    address_prefixes  = list(string)
    nsg_id            = optional(string)
    service_endpoints = optional(list(string))
    delegations = optional(list(object({
      name    = string
      service = string
    })))
  }))
}
