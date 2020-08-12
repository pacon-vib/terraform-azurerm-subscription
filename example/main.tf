variable "subscriptions" {
  default = [
    "Dev",
    "Test",
    "Prod",
  ]
}

variable "tenant_id" {
  type        = string
  description = "Guid of the Azure tenant to create the subscription in."
}

variable "client_id" {
  type        = string
  description = "Service principal to provision the subscription using."
}

variable "client_secret" {
  type        = string
  description = "Service principal secret to provision the subscription using."
}

module "subscription" {
  for_each = toset(var.subscriptions)
  source  = "../"
  name = each.key
  client_id = var.client_id
  client_secret = var.client_secret
  tenant_id = var.tenant_id
}
