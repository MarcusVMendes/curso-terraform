## init
Inicializa o terraform, fazendo o download do provider e dos modulos para a pasta do projeto. Cria o arquivo .terraform com as configurações baixadas.

## validate
Checa a integridade do código. Caso exista um erro de sintaxe, este comando avisará o módulo, mas não a linha onde está o erro

## plan
Demonstra as alterações que serão realizadas na infra, itens que serão adicionados, alterados ou excluidos.

## apply
Realiza o aceite das alterações. Primeiro irá verificar o que será alterado (plan) e depois as confirmará.

## destroy
Realiza o delete da infra. Primeiro irá verificar o que será alterado (plan) e depois as destruirá.

## fmt
Comando utilizado para formatar a identação do código.

[Documentação CLI](https://www.terraform.io/cli)