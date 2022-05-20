provider "google" {
  project = "treinamento-globo"
}

## para salvar o terraform state  no site app.terraform.io ##  OBS: nao tem custo
terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "treinamentos"
    workspaces {
      name = "treinamento-globo-terraform-simples"
    }
  }
}