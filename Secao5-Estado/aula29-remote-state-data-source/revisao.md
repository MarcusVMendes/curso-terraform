## Data Source
Tem por objetivo a importação de dados externos ao terraform. No entanto, para que isto ocorra, é necessário primeiro que tenham sido gerados outputs destes dados, para entao consumi-los por meio do bloco Data.

No exemplo da vpc, foi realizado os outputs da subnet_id e security_group_id, o que nos possibilita utilizar tais dados por meio do bloco data para a configuração da vm nas proximas aulas.

[Documentação Data Source](https://www.terraform.io/language/state/remote-state-data)