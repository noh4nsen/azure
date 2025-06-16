resource "azurerm_virtual_network" "this" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
}

resource "azurerm_subnet" "this" {
  for_each             = local.subnet_cfg

  name                 = each.key
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = each.value.address_prefixes

  service_endpoints    = try(each.value.service_endpoints, null)

  dynamic "delegation" {
    for_each = each.value.delegations != null ? each.value.delegations : []

    content {
      name = delegation.value.name
      service_delegation {
        name = delegation.value.service
      }
    }
  }
}

resource "azurerm_subnet_network_security_group_association" "this" {
  for_each = {
    for k, v in azurerm_subnet.this :
    k => {
      subnet_id = v.id
      nsg_id    = try(local.subnet_cfg[k].nsg_id, null)
    } if try(local.subnet_cfg[k].nsg_id, null) != null
  }

  subnet_id                 = each.value.subnet_id
  network_security_group_id = each.value.nsg_id
}
