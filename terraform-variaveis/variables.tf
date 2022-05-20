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

variable "compute_name" {
  type        = string
  description = "Nome da VM"
  default = "treinamento-computer"
}

variable "compute_type" {
  type        = string
  description = "size da vm"
  default = "e2-medium"
}