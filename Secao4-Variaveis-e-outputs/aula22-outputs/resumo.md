## Outputs
Os outputs nada mais são, do que uma forma de enviar para fora do terraform alguma informação.

## output.tf
A sintaxe do output é a seguinte:
```
output "alias" {
    value = valor
}
```
No que diz respeito ao valor, podem ser utilizadas referencias de outros blocos e atributos do bloco, como por exemplo o id do storage account, dentre outros atributos próprios do bloco.

[Outputs Documentation](https://www.terraform.io/language/values/outputs)