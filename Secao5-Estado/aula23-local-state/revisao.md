## terraform.tfstate
Nada mais é que o arquivo responsável por salvar o estado atual da aplicação. Vale ressaltar que, mesmo que um recurso tenha seu atributo sensitive = true, o valor do recurso será armazenado hard coded no state.

Outro ponto importante é que ao se deletar uma infra, o próprio terraform se encarrega de criar um arquivo backup com o estado anterior da infra.

Mais um ponto importante é que ao dar inicio nas alterações da infra, é criado um arquivo chamado de terraform.tfstate.lock.info, que tem por objetivo isolar o estado para que não ocorra modificações simultaneas de estado, evitando assim que outro usuario altere o estado enquanto o mesmo já está em processo de alteração.

[Documentação State](https://www.terraform.io/language/state)