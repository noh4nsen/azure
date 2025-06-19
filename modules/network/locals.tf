locals {
  subnet_cfg = {
    for name, cfg in var.subnets :
    name => merge(cfg, {
      name              = name
      delegations       = cfg.delegations != null ? cfg.delegations : []
      service_endpoints = cfg.service_endpoints != null ? cfg.service_endpoints : []
    })
  }
}