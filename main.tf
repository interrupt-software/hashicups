terraform {
  required_providers {
    hashicups = {
      source  = "interrupt-software/seng/hashicups"
      version = "0.2.0"
    }
  }
}

provider "hashicups" {}

# module "psl" {
#   source      = "app.terraform.io/interrupt-software/hashicups/provider"
#   version     = "0.2.0"
#   coffee_name = "Packer Spiced latte"
# }
#
# output "coffee" {
#   value = module.psl.coffee
# }

variable "coffee_name" {
  type    = string
  default = "Vagrante Espresso"
}

data "hashicups_coffees" "all" {}

# Returns all coffees
output "all_coffees" {
  value = data.hashicups_coffees.all.coffees
}

# Only returns packer spiced latte
output "coffee" {
  value = {
    for coffee in data.hashicups_coffees.all.coffees :
    coffee.id => coffee
    if coffee.name == var.coffee_name
  }
}
