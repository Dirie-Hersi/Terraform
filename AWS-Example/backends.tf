terraform {
  cloud {
    organization = "terraform-dnd"

    workspaces {
      name = "mtc-dev"
    }
  }
}