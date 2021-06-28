# CargoX Coding Challenge - Projeto ADM

## Para desenvolvimento da API utilizei as tecnologias abaixo:

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
