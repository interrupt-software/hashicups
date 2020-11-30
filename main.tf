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
  source = "github.com/interrupt-software/custom/coffee"

  coffee_name = "Packer Spiced Latte"
}

output "psl" {
  value = module.psl.coffee
}
