variable "subscriptions" {
  default = [
    "Dev",
    "Test",
    "Prod",
  ]
}

module "subscription" {
  for_each = toset(var.subscriptions)
  source  = "../"
  name = each.key
}
