## aws_vpc
[Documentação aws_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc)

## aws_subnet
[Documentação aws_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)

## aws_internet_gateway
[Documentação aws_internet_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/internet_gateway)

## aws_route_table
[Documentação aws_route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)

## aws_route_table_association
[Documentação aws_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association)

## aws_security_group
[Documentação aws_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)

Especialmente no aws_security_group, podemos alterar as configurações de acesso ao vpc. 



### Observaçao: em todos estes recursos, observar quais são os Arguments References requireds. Pode-se utilizar também os optionals, sobretudo os blocos de tags com atributos name, para facilitar a identificação do recurso na plataforma AWS. Feito isso, utilizar o exemplo da documentação que se aproximar do caso de uso e listar os recursos no arquivo network.tf (pode ser qualquer nome).