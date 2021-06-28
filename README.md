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

### As tarefas foram construir uma API utilizando JSON API para que seja possível criar, consultar, alterar e remover (CRUD) os recursos:
- Company
- Fundador
- Líder
- Coordenador
- Empregado Júnior
- Empregado Sênior

### As relações e atributos do banco de dados seguem o seguinte diagrama:
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
## Rotas e exemplo de curl

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
| `POST /api/v1/fundador`                  | Cadastrar um novo fundador.                |

```bash

```

| Rota                                     | Uso                                        |
| -----------------------------------------| ------------------------------------------ |
| `GET /api/v1/fundador`                   | Listar todos os fundadores.                |

```bash

```

| Rota                                     | Uso                                        |
| -----------------------------------------| ------------------------------------------ |
| `GET /api/v1/fundador/:fundador_id`      | Exibir detalhes de um fundador.            |

```bash

```

| Rota                                     | Uso                                        |
| -----------------------------------------| ------------------------------------------ |
| `PUT /api/v1/fundador/:fundador_id`     | Editar detalhes de um fundador.            |

```bash

```

| Rota                                     | Uso                                        |
| -----------------------------------------| ------------------------------------------ |
| `DEL /api/v1/fundador/:fundador_id`   | Deletar um fundador.                       |

```bash

```

## Empsr