## Local Values
Tem por objetivo a reutilização de código dentro dos blocos do terraform.

## locals.tf
Dentro do arquivo locals, basta adicionar o bloco locals com as referidas funções que serão utilizadas no restante do código:

```
locals {
    common_tags = {
        owner = "MarcusVMendes"
        managed_by = "terraform"
    }
}
```

Para utilizar o locals nos demais módulos, o utilizamos no singular:
```
local.common_tags
```