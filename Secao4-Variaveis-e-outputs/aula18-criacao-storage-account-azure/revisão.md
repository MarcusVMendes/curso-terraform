## Documentação Azure Provider
[Link Documentação](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)

## Explicação do fluxo

# main.tf
No caso da criação do recurso na Azure, ao invés de declararmos as configurações do provider, utilizamos a tag features {} para isto.

# storage.account.tf
Diferente da AWS, para criar um storage account na Azure, precisamos criar um resource group contendo pelo menos as tags obrigatórias exemplificadas na documentação (buscar por resource group no filtro).

Logo após, informaremos a storage account contendo pelo menos as tags obrigatórias exemplificadas na documentação (buscar por storage account no filtro).

E por fim, informaremos o storage container contendo pelo menos as tags obrigatórias exemplificadas na documentação (buscar por storage container no filtro).