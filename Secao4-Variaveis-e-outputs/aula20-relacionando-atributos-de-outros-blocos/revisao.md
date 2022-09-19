## Referenciar recursos de outros blocos
Para referenciar recursos de outros blocos, vamos utilizar como base o seguinte recurso:

```
resource "azurerm_resource_group" "first_resource_group" {
  name     = "recurso1"
  location = var.location
}
```
Para utilizar o atributo name do recurso acima, utilizamos a seguinte sintaxe:
```
azurerm_resource_group.first_resource_group.name
```

Desse modo, teremos acesso ao valor do atributo name no bloco em que queremos utiliza-lo.

##### OBSERVAÇÃO: A Storage Account da Azure não permite caracteres especiais nem espaços.

