## Terraform
Bloco onde estarão as configurações básicas do terraform, como a versão do terraform, providers e backend por exemplo.

## Provider (provider)
Bloco que faz referencia as configurações do provider, no caso do curso aws ou azure. A documentação explica como usar.

## Resource (resource + alias)
Bloco que faz referencia as configurações dos resourcer, no caso do curso resources disponiveis na aws ou azure. A documentação explica como usar.

## Data (data + alias)
Bloco responsável por buscar informações de fora do terraform para ser usado no código. Faz referência ao tipo de data que iremos buscar. No caso do exemplo, uma imagem da aws.

## Module (alias)
Bloco responsável por referenciar um módulo interno ou da comunidade.

## Variable
Bloco responsável por armazenar as variáveis utilizadas no código, de modo a referencia-las por meio de um alias.

## Output
Bloco responsável por exportar alguma informação para fora do código terraform.

## Locals
Bloco responsável por armazenar funções ou expressões que serão utilizadas com frequência no decorrer do código.