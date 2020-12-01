terraform {
  required_providers {
    hashicups = {
      source  = "interrupt-software/hashicups/custom"
      version = ">= 0.2.0"
    }
  }
}

provider "hashicups" {}

module "psl" {
  source      = "app.terraform.io/interrupt-software/coffee/hashicup"
  version     = "0.2.0"
  coffee_name = "Packer Spiced Latte"
}

output "coffee" {
  value = module.psl.coffee
}
