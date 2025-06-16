locals {
  subnet_cfg = {
    for name, cfg in var.subnets :
    name => merge(cfg, { name = name })
  }
}
