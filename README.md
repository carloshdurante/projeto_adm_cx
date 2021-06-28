# CargoX Coding Challenge - Projeto ADM

## Para desenvolvimento da API utilizei as depências abaixo:

<table>
  <tr>
    <td>Ruby version</td>
    <td>
      2.7.3
    </td>
  </tr>
  <tr>
    <td>Rails version</td>
    <td>
      6.1.x
    </td>
  </tr>
  <tr>
    <td>Database</td>
    <td>
      SQLite3
    </td>
  </tr>
</table>

O desafio proposto foi construir uma aplicação para cadastro de funcionários de cada empresa da qual pertence ao conglomerado CargoX Corp.

### Tarefa 1: construir uma API utilizando JSON API para que seja possível criar, consultar, alterar e remover (CRUD) os recursos:
- Company
- Fundador
- Líder
- Coordenador
- Empregado Júnior
- Empregado Sênior

## As relações e atributos do banco de dados seguem o seguinte diagrama:
```bash
+-------------+ *      1 +--------------+ 1      1 +-------------+
|   Company   +----------+   Fundador   +----------+    Lider    |
|             |          |              |          |             |
|  nome       |          |  nome        |          |  nome       |
|  CNPJ       |          |  sobrenome   |          |  sobrenome  |
|  fundação   |          |  idade       |          |  idade      |
|             |          |              |          |  área       |
+-------------+          +--------------+          |             |
                                                   +------+------+
                                                          | 1
                                                          |
                                     +--------------------+
                                     |
                                   * |
                            +--------+--------+
                            |   Coordenador   |
                            |                 |
                            |  nome           |
                            |  sobrenome      |
                            |  idade          |
                            |  contratado em  |
                            |                 |
                            +-+-------------+-+
                              |             |
                            1 |             | 1
                              |             |
                              |             |
                            * |             | *
            +-----------------+----+   +----+-----------------+
            |   Empregado Júnior   |   |   Empregado Sênior   |
            |                      |   |                      |
            |  nome                |   |  nome                |
            |  sobrenome           |   |  sobrenome           |
            |  idade               |   |  idade               |
            |  em experiência?     |   |  salário             |
            |  salário             |   |  em experiência?     |
            |                      |   |                      |
            +----------------------+   +----------------------+
```
## CRUD's - Rotas e exemplo de curl

## Fundador

| Rota                                     | Uso                                        |
| -----------------------------------------| ------------------------------------------ |
| `POST /api/v1/fundador`                  | Cadastrar um novo fundador.                |

```bash
curl --location --request POST 'localhost:3000/api/v1/fundador' \
--data-raw '{
    "nome": "Carlos",
    "sobrenome": "Durante",
    "idade": 27
}'
```

| Rota                                     | Uso                                        |
| -----------------------------------------| ------------------------------------------ |
| `GET /api/v1/fundador/:fundador_id`      | Exibir detalhes de um fundador.            |

```bash
curl --location --request GET 'localhost:3000/api/v1/fundador/1/'
```

| Rota                                     | Uso                                        |
| -----------------------------------------| ------------------------------------------ |
| `PUT /api/v1/fundador/:fundador_id`      | Editar detalhes de um fundador.            |

```bash
curl --location --request PUT 'localhost:3000/api/v1/fundador/1/' \
--data-raw '{
    "nome": "Henrique",
    "sobrenome": "Silva",
    "idade": 22
}'
```

| Rota                                     | Uso                                        |
| -----------------------------------------| ------------------------------------------ |
| `DEL /api/v1/fundador/:fundador_id`      | Deletar um fundador.                       |

```bash
curl --location --request DELETE 'localhost:3000/api/v1/fundador/1/'
```

## Company

| Rota                                     | Uso                                        |
| -----------------------------------------| ------------------------------------------ |
| `POST /api/v1/company`                   | Cadastrar uma nova companhia.              |

```bash
curl --location --request POST 'localhost:3000/api/v1/company' \
--data-raw '{
    "nome": "CargoX",
    "cnpj": "01234567890123",
    "fundacao": "2021-06-27",
    "fundador_id": 2
}'
```

| Rota                                     | Uso                                        |
| -----------------------------------------| ------------------------------------------ |
| `GET /api/v1/company/:company_id`        | Exibir detalhes de uma companhia.          |

```bash
curl --location --request GET 'localhost:3000/api/v1/company/1/'
```

| Rota                                     | Uso                                        |
| -----------------------------------------| ------------------------------------------ |
| `PUT /api/v1/company/:company_id`        | Editar detalhes de uma companhia.          |

```bash
curl --location --request PUT 'localhost:3000/api/v1/company/1/' \
--data-raw '{
    "nome": "Fretebras",
    "cnpj": "01234567890115",
    "fundacao": "2021-06-27",
    "fundador_id": 2
}'
```

| Rota                                     | Uso                                        |
| -----------------------------------------| ------------------------------------------ |
| `DEL /api/v1/company/:company_id`        | Deletar uma companhia.                     |

```bash
curl --location --request DELETE 'localhost:3000/api/v1/company/1/'
```

## Lider

| Rota                                     | Uso                                        |
| -----------------------------------------| ------------------------------------------ |
| `POST /api/v1/lider`                     | Cadastrar um novo líder.                   |

```bash
curl --location --request POST 'localhost:3000/api/v1/lider' \
--data-raw '{
    "nome": "Carlos",
    "sobrenome": "Durante",
    "idade": 27,
    "area": "Cadastro",
    "company_id": 2
}'
```

| Rota                                     | Uso                                        |
| -----------------------------------------| ------------------------------------------ |
| `GET /api/v1/lider/:lider_id`            | Exibir detalhes de um líder.               |

```bash
curl --location --request GET 'localhost:3000/api/v1/lider/1/'
```

| Rota                                     | Uso                                        |
| -----------------------------------------| ------------------------------------------ |
| `PUT /api/v1/lider/:lider_id`            | Editar detalhes de um líder.               |

```bash
curl --location --request PUT 'localhost:3000/api/v1/lider/1/' \
--data-raw '{
    "nome": "Carlos",
    "sobrenome": "Silva",
    "idade": 27,
    "area": "Cadastro",
    "company_id": 2
}'
```

| Rota                                     | Uso                                        |
| -----------------------------------------| ------------------------------------------ |
| `DEL /api/v1/lider/:lider_id`            | Deletar um líder.                          |

```bash
curl --location --request DELETE 'localhost:3000/api/v1/lider/1/'
```

## Coordenador

| Rota                                     | Uso                                        |
| -----------------------------------------| ------------------------------------------ |
| `POST /api/v1/coordenador`               | Cadastrar um novo coordenador.             |

```bash
curl --location --request POST 'localhost:3000/api/v1/coordenador' \
--data-raw '{
    "nome": "Luan",
    "sobrenome": "Mendieta",
    "idade": "30",
    "contratadoem": "2021-06-01",
    "lider_id": 2,
    "company_id": 2
}'
```

| Rota                                     | Uso                                        |
| -----------------------------------------| ------------------------------------------ |
| `GET /api/v1/coordenador/:coordenador_id`| Exibir detalhes de um coordenador.         |

```bash
curl --location --request GET 'localhost:3000/api/v1/coordenador/1/'
```

| Rota                                     | Uso                                        |
| -----------------------------------------| ------------------------------------------ |
| `PUT /api/v1/coordenador/:coordenador_id`| Editar detalhes de um coordenador.         |

```bash
curl --location --request PUT 'localhost:3000/api/v1/coordenador/1/' \
--data-raw '{
    "nome": "Luan",
    "sobrenome": "Mendieta",
    "idade": "32",
    "contratadoem": "2021-06-01",
    "lider_id": 2,
    "company_id": 2
}'
```

| Rota                                     | Uso                                        |
| -----------------------------------------| ------------------------------------------ |
| `DEL /api/v1/coordenador/:coordenador_id`| Deletar um coordenador.                    |

```bash
curl --location --request DELETE 'localhost:3000/api/v1/coordenador/1/'
```

## Empjr

| Rota                                     | Uso                                        |
| -----------------------------------------| ------------------------------------------ |
| `POST /api/v1/empjr`                     | Cadastrar um novo empregado júnior.        |

```bash
curl --location --request POST 'localhost:3000/api/v1/empjr' \
--data-raw '{
    "nome": "Thiago",
    "sobrenome": "Silva",
    "idade": 22,
    "emexperiencia": true,
    "salario": 2100.55,
    "coordenador_id": 2,
    "company_id": 2
}'
```

| Rota                                     | Uso                                        |
| -----------------------------------------| ------------------------------------------ |
| `GET /api/v1/empjr/:empjr_id`            | Exibir detalhes de um empregado júnior.    |

```bash
curl --location --request GET 'localhost:3000/api/v1/empjr/1/'
```

| Rota                                     | Uso                                        |
| -----------------------------------------| ------------------------------------------ |
| `PUT /api/v1/empjr/:empjr_id`            | Editar detalhes de um empregado júnior.    |

```bash
curl --location --request PUT 'localhost:3000/api/v1/empjr/1/' \
--data-raw '{
    "nome": "Thiago",
    "sobrenome": "Brito",
    "idade": 22,
    "emexperiencia": true,
    "salario": 2100.55,
    "coordenador_id": 2,
    "company_id": 2
}'
```

| Rota                                     | Uso                                        |
| -----------------------------------------| ------------------------------------------ |
| `DEL /api/v1/empjr/:empjr_id`            | Deletar um empregado júnior.               |

```bash
curl --location --request DELETE 'localhost:3000/api/v1/empjr/1/'
```

## Empsr

| Rota                                     | Uso                                        |
| -----------------------------------------| ------------------------------------------ |
| `POST /api/v1/empsr`                     | Cadastrar um novo empregado sênior.        |

```bash
curl --location --request POST 'localhost:3000/api/v1/empsr' \
--data-raw '{
    "nome": "Thiago",
    "sobrenome": "Silva",
    "idade": 22,
    "emexperiencia": true,
    "salario": 2100.55,
    "coordenador_id": 2,
    "company_id": 2
}'
```

| Rota                                     | Uso                                        |
| -----------------------------------------| ------------------------------------------ |
| `GET /api/v1/empsr/:empsr_id`            | Exibir detalhes de um empregado sênior.    |

```bash
curl --location --request GET 'localhost:3000/api/v1/empsr/1/'
```

| Rota                                     | Uso                                        |
| -----------------------------------------| ------------------------------------------ |
| `PUT /api/v1/empsr/:empsr_id`            | Editar detalhes de um empregado sênior.    |

```bash
curl --location --request PUT 'localhost:3000/api/v1/empsr/1/' \
--data-raw '{
    "nome": "Thiago",
    "sobrenome": "Brito",
    "idade": 22,
    "emexperiencia": true,
    "salario": 2100.55,
    "coordenador_id": 2,
    "company_id": 2
}'
```

| Rota                                     | Uso                                        |
| -----------------------------------------| ------------------------------------------ |
| `DEL /api/v1/empsr/:empsr_id`            | Deletar um empregado sênior.               |

```bash
curl --location --request DELETE 'localhost:3000/api/v1/empsr/1/'
```

### Tarefa 2: Disponibilizar rota para consulta de um sumário das companhias ordenadas em ordem crescente(nome, nome do fundador, número de funcionários) com os seguintes dados:

- Nome da companhia
- CNPJ
- Nome do fundador
- Número total de funcionários
- Número total de líderes
- Número total de coordenadores
- Número total de empregados sênior
- Número total de empregados júnior

| Rota                                     | Uso                                        |
| -----------------------------------------| ------------------------------------------ |
| `GET /api/v1/sumario`                    | Sumário das companhias.                    |

```bash
curl --location --request GET 'localhost:3000/api/v1/sumario'
```

### Tarefa 3: Disponibilizar uma rota para contratação de novos empregados (Júnior ou Sênior) que receba os seguintes parâmetros:

- Nome
- Sobrenome
- Idade
- Salário
- Nível (Júnior ou  Sênior)

| Rota                                     | Uso                                        | Observação                                  |
| -----------------------------------------| ------------------------------------------ | ------------------------------------------- |
| `POST /api/v1/contratacao`               | Contratação de um novo empregado Jr ou Sr. | Em nível deverá ser informado 'sr' ou 'jr'. |

```bash
curl --location --request POST 'localhost:3000/api/v1/contratacao' \
--data-raw '{
    "verificacao": {
        "nivel": "sr"
    },
    "contratacao": {
        "nome": "Bruna",
        "sobrenome": "Fernandes",
        "idade": 29,
        "emexperiencia": false,
        "salario": 3200.52,
        "coordenador_id": 2,
        "company_id": 2
    }
}'
```

### Tarefa 4: Documentação das rotas e exemplos de curl para teste da API

Acima está descrito toda a documentação e exemplos de __curl__ para teste na API. Utilizei o POSTMAN como auxílio na criação.


### Considerações

Gostei muito de realizar esse desafio, pois me deparei com um cenário totalmente novo. Nunca tive contato com a linguagem Ruby e com o framework Rails, portanto tive que estudar bastante para conseguir cumprir todas as tarefas. Na faculdade minha experiência durante os semestres em programação foi com Python, utilizamos o Flask para criação de uma API. Em comparação com o Rails, a criação da base da API é mais simples, pois em Python temos que criar toda a base da API manualmente, já o Rails cria toda essa base inicial com poucas linhas de comando. Irei continuar estudando Ruby on Rails para que eu possa aprimorar meu conhecimento técnico da linguagem, familiarizando com a sintaxe da linguagem e explorando o framework para que consiga aos poucos avançar em projetos mais complexos.

Estou bem satisfeito com o resultado e pretendo avançar com esse projeto como estudo pessoal, em uma próxima versão como melhoria da aplicação, gostaria de incrementar alguns itens. O  GraphQL, pois pelo pouco que li sobre, é um facilitador na hora de realizar as requisições e testes em uma API. Estudar e acrescentar autenticação na API, enquanto estava estudando para a criação, vi como funcionava, porém não consegui aplicar. Alterar o banco de dados para Postgresql, fazendo com que o SQLite fique em ambiente de desenvolvimento e quando subir a aplicação em um ambiente de produção use o Postgresql, tentei implementar para subir no Heroku, porém ainda não consegui.