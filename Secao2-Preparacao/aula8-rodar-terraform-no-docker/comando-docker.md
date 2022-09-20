# Comando para criar o container com imagem Terraform:

```
docker run -it --name terraform -v `pwd`:/app/curso-terraform --entrypoint /bin/sh hashicorp/terraform
```

# Explicação dos comandos:

* **docker run** - comando para criar o container baseado em uma imagem
* **-it** - flag para acessar o terminal interativo após a criação
* **--name** - flag para dar nome ao container criado
* **-v** - flag para criação do volume, ou seja, para atualização do conteudo atual para dentro do container
* **pwd** - caminho absoluto do diretorio (/home/usuario/demaisdiretorios)
* **/app/curso-terraform** - onde estarão os arquivos do volume criado
* **--entrypoint** - flag que aponta qual arquivo será iniciado quando o container subir
* **hashicorp/terraform** - imagem utilizada para a criaçao do container

[Imagem Oficial Terraform](https://hub.docker.com/r/hashicorp/terraform/)