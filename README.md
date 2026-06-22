# Projeto de Banco de Dados — Sistema de Controle de Estoque

## Integrantes

| Nome                       | Matrícula  |
| -------------------------- | ---------- |
| Daniel Luiz dos Santos     | UC22103186 |
| Caio Manoel Costa Leonardo | UC22200020 |

---

## Descrição do Projeto

Este repositório apresenta o projeto de banco de dados desenvolvido para a disciplina de Banco de Dados, com o objetivo de demonstrar os conhecimentos trabalhados ao longo do semestre, incluindo modelagem lógica, criação de schema, definição de tabelas, relacionamentos, carga inicial de dados e consultas estatísticas utilizando SQL.

O tema escolhido pelo grupo foi um **Sistema de Controle de Estoque**, voltado para o gerenciamento de produtos, usuários, perfis de acesso e movimentações de entrada e saída de itens no estoque.

A proposta do banco é permitir o controle organizado dos produtos cadastrados, o acompanhamento das quantidades disponíveis e o registro histórico das movimentações realizadas por usuários do sistema. Dessa forma, é possível identificar quais produtos foram movimentados, qual usuário realizou a operação, o tipo de movimentação executada e a quantidade envolvida.

---

## Objetivo do Banco de Dados

O objetivo principal deste projeto é construir uma estrutura de banco de dados relacional capaz de representar o funcionamento básico de um sistema de estoque.

O banco foi pensado para atender situações como:

* Cadastro de usuários do sistema;
* Controle de perfis de acesso;
* Cadastro de produtos;
* Registro de produtos ativos e inativos;
* Registro de tipos de movimentação de estoque;
* Controle de movimentações realizadas no estoque;
* Geração de consultas estatísticas e relatórios com base nos dados cadastrados.

---

## Entidades do Projeto

O modelo do banco de dados é composto pelas seguintes entidades principais:

### Perfil

Representa os perfis de acesso dos usuários dentro do sistema.

Exemplos de perfis:

* Administrador;
* Gerente;
* Estoquista;
* Vendedor;
* Supervisor;
* Consulta.

Cada usuário cadastrado no sistema está vinculado a um perfil.

---

### Usuário

Representa os usuários que podem realizar operações no sistema.

Cada usuário possui informações como:

* Nome;
* E-mail;
* Senha;
* Status ativo ou inativo;
* Data de cadastro;
* Perfil associado.

A tabela de usuários está relacionada com a tabela de perfis, permitindo identificar o nível ou função de cada usuário dentro do sistema.

---

### Produto

Representa os itens controlados pelo estoque.

Cada produto possui informações como:

* Nome;
* Descrição;
* Preço;
* Quantidade em estoque;
* Status ativo ou inativo;
* Data de cadastro.

Essa entidade é essencial para o controle dos itens disponíveis e para a geração de relatórios sobre valores, quantidades e status dos produtos.

---

### Tipo de Movimentação

Representa os tipos possíveis de movimentação no estoque.

Exemplos:

* Entrada;
* Saída;
* Ajuste;
* Devolução;
* Transferência.

Essa entidade permite padronizar as operações realizadas no estoque, evitando que os tipos de movimentação sejam cadastrados de forma inconsistente.

---

### Movimentação de Estoque

Representa o histórico das movimentações realizadas nos produtos.

Cada movimentação registra:

* Produto movimentado;
* Usuário responsável pela movimentação;
* Tipo de movimentação;
* Quantidade movimentada;
* Data da movimentação;
* Observação.

Essa tabela é importante para manter a rastreabilidade das operações realizadas no estoque.

---

## Relacionamentos

O banco de dados possui os seguintes relacionamentos principais:

* Um **perfil** pode estar associado a vários **usuários**;
* Um **usuário** pertence a um único **perfil**;
* Um **produto** pode possuir várias **movimentações de estoque**;
* Uma **movimentação de estoque** está associada a um único **produto**;
* Um **usuário** pode realizar várias **movimentações de estoque**;
* Uma **movimentação de estoque** é realizada por um único **usuário**;
* Um **tipo de movimentação** pode estar associado a várias **movimentações de estoque**;
* Uma **movimentação de estoque** possui um único **tipo de movimentação**.

Esses relacionamentos permitem que o banco armazene os dados de forma organizada e mantenha a integridade entre as tabelas.

---

## Estrutura dos Arquivos

O repositório contém os seguintes arquivos principais:

| Arquivo                     | Descrição                                                                                                                                                        |
| --------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `modelo_fisico_estoque.sql` | Script DDL responsável pela criação do banco de dados, tabelas, chaves primárias, chaves estrangeiras e relacionamentos.                                         |
| `insert_banco.sql`          | Script DML responsável pela carga inicial de dados no banco, contendo registros de perfis, usuários, produtos, tipos de movimentação e movimentações de estoque. |
| `calculos.sql`              | Script DQL contendo consultas estatísticas e relatórios utilizando funções como `AVG`, `MAX`, `MIN`, `COUNT`, `SUM` e operações com `JOIN`.                      |
| `modelo_conceitual2.0.png`  | Diagrama do modelo conceitual do banco de dados.                                                                                                                 |
| `modelo_logico2.0.png`      | Diagrama do modelo lógico do banco de dados.                                                                                                                     |

---

## Scripts SQL

### DDL — Criação do Banco

O script `modelo_fisico_estoque.sql` é responsável por criar o banco de dados `controle_estoque` e todas as tabelas necessárias para o funcionamento do modelo.

As principais estruturas criadas são:

* Banco de dados;
* Tabelas;
* Chaves primárias;
* Chaves estrangeiras;
* Campos obrigatórios;
* Restrições de unicidade;
* Relacionamentos entre as entidades.

---

### DML — Carga Inicial dos Dados

O script `insert_banco.sql` realiza a inserção dos dados iniciais no banco.

A carga inicial contempla registros distribuídos entre as tabelas do sistema, atendendo ao requisito de possuir no mínimo 100 registros entre as tabelas.

São inseridos dados como:

* Perfis de acesso;
* Usuários;
* Produtos;
* Tipos de movimentação;
* Movimentações de estoque.

Esses dados permitem testar as consultas e simular um ambiente básico de funcionamento do sistema de estoque.

---

### DQL — Consultas e Relatórios

O script `calculos.sql` contém consultas utilizadas para extrair informações estatísticas e relatórios a partir dos dados cadastrados.

Entre as consultas realizadas estão:

* Preço médio dos produtos;
* Maior preço de produto;
* Menor preço de produto;
* Quantidade total de itens em estoque;
* Valor total do estoque;
* Total de produtos ativos e inativos;
* Quantidade de usuários por perfil;
* Total de movimentações por tipo;
* Soma de itens movimentados;
* Estatísticas gerais das movimentações de estoque.

As consultas utilizam funções SQL como:

* `AVG`;
* `MAX`;
* `MIN`;
* `COUNT`;
* `SUM`;
* `ROUND`.

Também são utilizados relacionamentos entre tabelas por meio de `JOIN`, permitindo gerar relatórios com dados combinados de diferentes entidades.

---

## Como Executar o Projeto

Para executar os scripts do projeto, recomenda-se seguir a seguinte ordem:

1. Executar o script de criação do banco:

```sql
modelo_fisico_estoque.sql
```

2. Executar o script de carga inicial dos dados:

```sql
insert_banco.sql
```

3. Executar o script de consultas e relatórios:

```sql
calculos.sql
```

Essa ordem garante que o banco seja criado corretamente, os dados sejam inseridos e, em seguida, as consultas possam ser executadas com sucesso.

---

## Tecnologias Utilizadas

* SQL;
* Banco de dados relacional;
* MySQL;
* GitHub para versionamento e entrega dos arquivos.

---

## Requisitos Atendidos

| Requisito                                                                    | Status                                           |
| ---------------------------------------------------------------------------- | ------------------------------------------------ |
| Projeto lógico com diagrama Entidade-Relacionamento                          | Atendido                                         |
| Script SQL DDL para criação do schema, tabelas e relacionamentos             | Atendido                                         |
| Script SQL DML com carga inicial de, no mínimo, 100 registros                | Atendido                                         |
| Script SQL DQL com estatísticas e relatórios usando funções agregadas e JOIN | Atendido                                         |
| Repositório no GitHub contendo scripts e diagramas                           | Atendido                                         |
| Vídeo de apresentação e link do repositório                                  | Atendido                                         |

---

## Considerações Finais

O projeto desenvolvido representa um modelo de banco de dados para controle de estoque, contemplando desde a modelagem das entidades até a criação de consultas para análise dos dados.

A estrutura permite controlar produtos, usuários, perfis de acesso e movimentações de estoque, garantindo organização e rastreabilidade das operações realizadas.

Com isso, o banco de dados demonstra a aplicação prática dos principais conceitos estudados ao longo do semestre, como modelagem relacional, criação de tabelas, definição de relacionamentos, inserção de dados e realização de consultas estatísticas.
