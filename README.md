# Terraform com Docker

# Comando para criar o container com imagem Terraform:

```
docker run -it --name terraform -v `pwd`:/app/curso-terraform --entrypoint /bin/sh hashicorp/terraform
```

# Explicação do comando:

* **docker run** - comando para criar o container baseado em uma imagem
* **-it** - flag para acessar o terminal interativo após a criação
* **--name** - flag para dar nome ao container criado
* **-v** - flag para criação do volume, ou seja, para atualização do conteudo atual para dentro do container
* **pwd** - caminho absoluto do diretorio (/home/usuario/demaisdiretorios)
* **/app/curso-terraform** - onde estarão os arquivos do volume criado
* **--entrypoint** - flag que aponta qual arquivo será iniciado quando o container subir
* **hashicorp/terraform** - imagem utilizada para a criaçao do container

[Imagem Oficial Terraform](https://hub.docker.com/r/hashicorp/terraform/)

---
# Tipos de Blocos Terraform

## Terraform
Bloco onde estarão as configurações básicas do terraform, como a versão do terraform, providers e backend por exemplo.

[Documentação Bloco Terraform](https://www.terraform.io/language/settings)

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

---

# CLI Terraform 

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

---

# Criação de Bucket AWS

[Documentação Provider AWS](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
[Lista de Regiões AWS](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html)

---

# Criação de Storage Account Azure

## Documentação Azure Provider
[Link Documentação](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)

## Explicação do fluxo

# main.tf
No caso da criação do recurso na Azure, ao invés de declararmos as configurações do provider, utilizamos a tag features {} para isto.

# storage.account.tf
Diferente da AWS, para criar um storage account na Azure, precisamos criar um resource group contendo pelo menos as tags obrigatórias exemplificadas na documentação (buscar por resource group no filtro).

Logo após, informaremos a storage account contendo pelo menos as tags obrigatórias exemplificadas na documentação (buscar por storage account no filtro).

E por fim, informaremos o storage container contendo pelo menos as tags obrigatórias exemplificadas na documentação (buscar por storage container no filtro).

---

# Variaveis no Terraform 

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

---

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

[Documentação Referências](https://www.terraform.io/language/expressions/references)

---

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

---

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

---

## terraform.tfstate
Nada mais é que o arquivo responsável por salvar o estado atual da aplicação. Vale ressaltar que, mesmo que um recurso tenha seu atributo sensitive = true, o valor do recurso será armazenado hard coded no state.

Outro ponto importante é que ao se deletar uma infra, o próprio terraform se encarrega de criar um arquivo backup com o estado anterior da infra.

Mais um ponto importante é que ao dar inicio nas alterações da infra, é criado um arquivo chamado de terraform.tfstate.lock.info, que tem por objetivo isolar o estado para que não ocorra modificações simultaneas de estado, evitando assim que outro usuario altere o estado enquanto o mesmo já está em processo de alteração.

[Documentação State](https://www.terraform.io/language/state)

---

Atualizações Recentes que Impactam a Próxima Aula
Recentemente a AWS lançou a versão 4 do seu provider do Terraform.

Essa nova versão impactou diretamente a forma como os blocos das buckets S3 são construídos.

O curso foi todo gravado com a versão 3.73.0 do provider da AWS, versão que ainda não havia sido impactada por essas mudanças.

Novas aulas já estão sendo gravadas para atualizar o conteúdo, mas enquanto elas não ficam prontas, você tem duas opções ao criar a bucket da próxima aula:



1 - Usar o provider na mesma versão que foi usada no vídeo e montar a estrutura de blocos para criação da bucket seguindo o formato da aula.

    aws = {
      source  = "hashicorp/aws"
      version = "3.73.0"
    }


2 - Usar o provider na versão mais recente e montar a estrutura de blocos para a criação da bucket no novo formato.

    aws = {
      source  = "hashicorp/aws"
      version = "4.12.1"
    }


resource "aws_s3_bucket" "first_bucket" {
  bucket = "danielgil-remote-state"
}
 
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.first_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

---

## Remote State
Para a criação do [estado remoto](https://www.terraform.io/language/state/remote), primeiro é necessario a criação do [backend](https://www.terraform.io/language/settings/backends/configuration) no bloco terraform.

A documentação do backend possui o passo a passo necessario para gerar as configurações dos backends, tanto do [AWS S3](https://www.terraform.io/language/settings/backends/s3) quanto do [Azure Storage Account](https://www.terraform.io/language/settings/backends/azurerm)


---

# VPC AWS

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

---

## VPC Azure

Passo a passo:

1 - Configuração do backend no bloco terraform com as configurações do storage account.
2 - Criação dos recursos no arquivo network.tf (docs em azure provider)

## azurerm_virtual_network
[Documentação azurerm_virtual_network](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network)

## azurerm_subnet
[Documentação azurerm_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet)

## azurerm_network_security_group
[Documentação azurerm_network_security_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group#argument-reference)

## azurerm_subnet_network_security_group_association
[Documentação azurerm_subnet_network_security_group_association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association)

---

## Data Source
Tem por objetivo a importação de dados externos ao terraform. No entanto, para que isto ocorra, é necessário primeiro que tenham sido gerados outputs destes dados, para entao consumi-los por meio do bloco Data.

No exemplo da vpc, foi realizado os outputs da subnet_id e security_group_id, o que nos possibilita utilizar tais dados por meio do bloco data para a configuração da vm nas proximas aulas.

[Documentação Data Source](https://www.terraform.io/language/state/remote-state-data)

---

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

---

## Terraform Import
Diferentemente do Data Source que serve para importar alguns dados especificos, o Terraform Import tem por objetivo importar recursos.

Primeiro, é necessario criar um bloco de referencia para o recurso e depois importa-lo via linha de comando.

[Terraform Import](https://www.terraform.io/cli/import/usage)

---

## Provisioners
Provisioners nada mais são do que nested blocks, ou seja, tratam-se de blocos dentro de recursos. Provisioners atuam rodando scripts dentro do terraform, no entanto, a própria documentação adverte que o uso destes deve ser feito em ultimo caso.

Existem 3 tipos de provisioners: provisioner file, provisioner local-exec e provisioner remote-exec

É possivel executar multiplos provisioners dentro de um recurso, bem como definir o que acontecerá em caso de falha na execução do provisioner.

Para rodar um provisioner dentro de um ambiente remoto, precisamos utilizar também um bloco de connection

[Documentação Provisioners](https://www.terraform.io/language/resources/provisioners/syntax)
[Documentação Connection](https://www.terraform.io/language/resources/provisioners/connection)

---

## Provisioner local-exec
Utilizado para rodar comandos na maquina local.

[Documentação Provisioner local-exec](https://www.terraform.io/language/resources/provisioners/local-exec)

---

## Provisioner remote-exec
Utilizado para rodar comandos na maquina remota.
Para utiliza-lo precisamos do bloco de provisioner, além do bloco de connection.

Podemos utiliza-lo para enviar diversos comandos em linha para o mesmo remoto, ou até mesmo escrever um script com diversos comandos e passar o path para a execução do mesmo.

[Documentação Provisioner remote-exec](https://www.terraform.io/language/resources/provisioners/remote-exec)
[Documentação Connection](https://www.terraform.io/language/resources/provisioners/connection)

---

## Provisioner file
Utilizado para copiar um arquivo para dentro de uma maquina remota por exemplo.
Pode ser usado para escrever dentro de um arquivo.

[Documentação Provisioner file](https://www.terraform.io/language/resources/provisioners/file)

---

## Modulos
Modulos nada mais são, do que conjuntos de arquivos terraform, com o objetivo de reutilização de código.
Podem ser classificados como modulos locais ou modulos remotos.

Sendo assim, o diretório principal é considerado o modulo root e, dentro dele, podem ser criados child modules, ou seja, modulos filhos.

No entanto, existe a possibilidade de se trabalhar com modulos que foram publicados no terraform registry
[Documentação Módulos](https://www.terraform.io/language/modules)

---

# Meta Arguments

## Lifecycle
[Documentação Lifecycle](https://developer.hashicorp.com/terraform/language/meta-arguments/lifecycle)

## Resource Provider
[Documentação Resource Provider](https://developer.hashicorp.com/terraform/language/meta-arguments/resource-provider)

## Module Provider
[Documentação Module Provider](https://developer.hashicorp.com/terraform/language/meta-arguments/module-providers)

## For each
[Documentação For each](https://developer.hashicorp.com/terraform/language/meta-arguments/for_each)

## Count
[Documentação Count](https://developer.hashicorp.com/terraform/language/meta-arguments/count)

## Depends on
[Documentação Depends on](https://developer.hashicorp.com/terraform/language/meta-arguments/depends_on)

---

# Funções e Expressões

## Built-in Functions
[Documentação Built-in Functions](https://developer.hashicorp.com/terraform/language/functions)

## Dynamic Blocks
[Documentação Dynamic Blocks](https://developer.hashicorp.com/terraform/language/expressions/dynamic-blocks)

## Splat Expression
[Documentação ](https://developer.hashicorp.com/terraform/language/expressions/splat)

## For Expression
[Documentação For Expression](https://developer.hashicorp.com/terraform/language/expressions/for)

## Conditional Expression
[Documentação Conditional Expression](https://developer.hashicorp.com/terraform/language/expressions/conditionals)