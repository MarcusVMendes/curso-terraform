## variables.tfvar
Normalmente as variavéis são criadas em um módulo distinto com a seguinte estrutura:

```
variable "location" {
    description = "localização onde serão criados os recursos"
    type        =  string
    default     = "East US 2"
    sensitive   = true -> caso seja informação sensivel, para esconder no plan.
}
```

Para utilizar tal variável, utiliza-se:
```
var.location
```
Desse modo, o terraform pegará o valor default da variavél. No caso do description, trata-se de um valor mais documental.

[Documentação Provider Azure](https://www.terraform.io/language/values/variables)
[Lista de Regiões Azure](https://learn.microsoft.com/en-us/azure/availability-zones/az-overview)