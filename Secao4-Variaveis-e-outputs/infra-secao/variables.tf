variable "location" {
  description = "variavél que indica onde o recurso será criado"
  type        = string
  default     = "East US 2"
}

variable "account_tier" {
  description = "variavél que indica a account_tier"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "variavél que indica o account_replication_type"
  type        = string
  default     = "LRS"
}