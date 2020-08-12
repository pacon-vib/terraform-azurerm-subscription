locals {
  type_codes = {
    "DevTest" = "MS-AZR-0148P",
    "Prod"    = "MS-AZR-0017P"
  }
}

# Note that the subscription cannot be programmatically deleted, 
# it is just removed from Terraform's state file
resource "shell_script" "subscription" {
  working_directory = path.module
  lifecycle_commands {
    create = ". ./subscription.ps1; Create"
    read   = ". ./subscription.ps1; Read"
    update = ". ./subscription.ps1; Update"
    delete = ". ./subscription.ps1; Delete"
  }
  environment = {
    name   = var.name
    tenant = var.tenant_id
    type   = local.type_codes[var.type]
  }
  interpreter = ["pwsh", "-command"]

  sensitive_environment = {
    azsub_client_id     = var.client_id
    azsub_client_secret = var.client_secret
  }
}
