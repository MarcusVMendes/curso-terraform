## Provisioners
Provisioners nada mais são do que nested blocks, ou seja, tratam-se de blocos dentro de recursos. Provisioners atuam rodando scripts dentro do terraform, no entanto, a própria documentação adverte que o uso destes deve ser feito em ultimo caso.

Existem 3 tipos de provisioners: provisioner file, provisioner local-exec e provisioner remote-exec

É possivel executar multiplos provisioners dentro de um recurso, bem como definir o que acontecerá em caso de falha na execução do provisioner.

Para rodar um provisioner dentro de um ambiente remoto, precisamos utilizar também um bloco de connection

[Documentação Provisioners](https://www.terraform.io/language/resources/provisioners/syntax)
[Documentação Connection](https://www.terraform.io/language/resources/provisioners/connection)