terraform {
  required_providers {
    hashicups = {
<<<<<<< HEAD
      source  = "interrupt-software/edu/hashicups"
=======
      source  = "interrupt-software/eng/hashicups"
>>>>>>> 42674aa58bf21bd35fa5fb6a9244a480824e5778
      version = ">= 0.2.0"
    }
  }
}

provider "hashicups" {}

module "psl" {
  source      = "app.terraform.io/interrupt-software/hashicups/provider"
  version     = "0.2.0"
  coffee_name = "Packer Spiced Latte"
}

output "coffee" {
  value = module.psl.coffee
}
