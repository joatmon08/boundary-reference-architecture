# These outputs are used by the Boundary terraform config as inputs
# to perform the initial configuration of Boundary

output "resource_group_name" {
  value = local.resource_group_name
}

output "resource_group_location" {
  value = var.location
}

output "vault_name" {
  value = local.vault_name
}

output "tenant_id" {
  value = data.azurerm_client_config.current.tenant_id
}

output "url" {
  value = "https://${azurerm_public_ip.boundary.fqdn}:9200"
}

output "client_id" {
  value = azuread_service_principal.recovery_sp.application_id
}

output "client_secret" {
  value = azuread_service_principal_password.recovery_sp.value
}

output "target_ips" {
  value = azurerm_network_interface.backend[*].private_ip_address
}

output "public_dns_name" {
  value = azurerm_public_ip.boundary.fqdn
}

output "private_key" {
  value     = tls_private_key.boundary.private_key_pem
  sensitive = true
}

output "worker_subnet_id" {
  value = module.vnet.vnet_subnets[1]
}

output "backend_subnet_id" {
  value = module.vnet.vnet_subnets[2]
}