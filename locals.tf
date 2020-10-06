locals {
  app_name = "${var.app_name}-${var.env}"

  tags = {
    Project   = local.app_name
    Env       = var.env
    ManagedBy = "Terraform"
    Owner     = "E-Commerce App"
  }
}