## Vincular VM a VPC
Para vincular a VM a VPC criada na aula 27, primeiro precisamos fazer o output dos id's da VPC, para então utliza-los por meio do Data Source.

[Data Source Configuration](https://www.terraform.io/language/settings/backends/s3)

Neste contexto, acessamos a pasta da VPC criada, pois ela contém os exports citados.

## Criação da VM
Para a criação da VM, precisaremos de dois recursos, o aws_key_pair e aws_instance

## aws_key_pair
Precisamos gerar uma chave pública. Assim, no terminal utilizamos o comando:
```
ssh-keygen -f nomedakey
```
Para indicar o caminho da chave no recurso aws_key_pair, utilizamos a função file('path')
[Documentação aws_key_pair](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair)
[Documentação função file](https://www.terraform.io/language/functions/file)

## aws_instance
Para criar de fato a instancia VM na AWS
[Documentação aws_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance)
Para pegar o Amazon Machine Image (AMI) na AWS, buscar por EC2 > Instancias > copiar o codigo AMI da instancia, neste caso de uma maquina ubuntu.

Realizadas as configurações no bloco aws_instance, basta criar um output para exportar o ip publico obtido por meio do VM. (output.tf)

## Acessar a maquina virtual
Para acessar a maquina virtual criada, basta realizar o seguinte comando no terminal:
```
ssh -i nomedachave ubuntu@ipdavm
```




### Observação: Como nos demais recursos, podemos seguir direto para o campo Arguments Reference para compreender quais são os atributos obrigatórios e caso algum recurso opcional faça sentido, podemos utilizá-lo.