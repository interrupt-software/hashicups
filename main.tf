terraform {
  required_providers {
    hashicups = {
      source  = "interrupt-software.s3.amazonaws.com/seng/hashicups"
      version = "0.2.0"
    }
  }
}

provider "hashicups" {}

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
