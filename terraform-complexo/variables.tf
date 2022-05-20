variable "project" {
  type        = string
  description = "projeto em que será entregue a solução"
  default = "treinamento-globo"
}

variable "region" {
  type        = string
  description = "região em que será entregue a solução"
  default = "us-central1"
}

variable "network_name" {
  type        = string
  description = "network em que será entregue a solução"
  default = "treinamento-network"
}

variable "subnet_name" {
  type        = string
  description = "subnet em que será entregue a solução"
  default = "treinamento-subnet"
}


variable "service_account_scopes" {
  type = list(string)
  default = [
    "https://www.googleapis.com/auth/cloud.useraccounts.readonly",
    "https://www.googleapis.com/auth/devstorage.read_only",
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring.write"
  ]
}

variable "specification" {
  type = map(object({
    instance_type       = string
    volume_size         = string
    image               = string
    gpu_type            = string
    gpu_count           = number
    volume_type         = string
  }))
  description = "Especificações validadas"
  default = {
    "treinamento-compute-1" = {
      instance_type       = "e2-medium"
      volume_size         = "50"
      on_host_maintenance = "TERMINATE"
      image               = "debian-cloud/debian-9"
      gpu_type            = ""
      gpu_count           = 0
      volume_type         = "pd-standard"
    },
    "treinamento-compute-2" = {
      instance_type       = "e2-medium"
      volume_size         = "50"
      image               = "debian-cloud/debian-9"
      gpu_type            = ""
      gpu_count           = 0
      volume_type         = "pd-ssd"
    }
  }
}


variable "status" {
  description = "variavel responsavel pelo controle de execucao dos servicos"
  type = object({
    treinamento-compute-1             = string
    treinamento-compute-2        = string
  })
  default = {
    treinamento-compute-1             = "RUNNING"
    treinamento-compute-2        = "RUNNING"

  }
}