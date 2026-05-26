# Trabalho Final de Banco de Dados I

## StreamDB — Banco de Dados de Plataforma de Streaming

Trabalho Final — Banco de Dados I | PUCRS;
Disciplina ministrada pelo Prof. Lucas Rafael Costella Pessutto


## Sobre o Projeto
Modelagem e implementação completa de um banco de dados relacional inspirado em plataformas de streaming de vídeo (como Netflix). O projeto cobre todas as etapas do ciclo de desenvolvimento de um banco de dados: da modelagem conceitual à implementação física com consultas SQL.

## Modelo de Dados
O banco representa o domínio de uma plataforma de streaming com as seguintes entidades:
CONTA - > Usuário cadastrado na plataforma (CPF, e-mail, endereço, plano)
PERFIL -> Perfis vinculados a uma conta (nome, classificação, foto)
PLANO -> Planos de assinatura disponíveis (mensal/anual)
CONTEUDO -> Filmes e séries disponíveis na plataforma
FILME -> Especialização de Conteúdo — dados específicos de filmes
SERIE -> Especialização de Conteúdo — dados específicos de séries
DIRETOR -> Diretores dos conteúdos
ELENCO -> Atores e atrizes do elenco
GENERO -> Gêneros cinematográficos
ASSISTE -> Histórico de visualização por perfil
DISPOSITIVO -> Dispositivos usados para acesso
PAGAMENTO -> Registro de pagamentos realizados
ATUAM -> Relacionamento entre elenco e conteúdo
CLASSIFICACAO -> Relacionamento entre gênero e conteúdo

## Consultas Implementadas
### O projeto inclui 18 consultas SQL cobrindo os seguintes recursos:
ORDER BY DESC -> Gêneros ordenados por nome de forma decrescente
COUNT -> Total de conteúdos cadastrados
SUM -> Soma dos valores anuais dos planos
MAX -> Conteúdo com maior duração5MINPlano com menor valor mensal
AVG -> Média das notas dos conteúdos assistidos
JOIN -> Filmes com seus respectivos prêmios
JOIN (3 tabelas) -> Atores e os conteúdos em que atuaram9BETWEENConteúdos lançados entre 2010 e 2020
IN -> Filtragem de gêneros específicos
INNER JOIN -> Perfis com dados da conta vinculada
LEFT JOIN -> Conteúdos com seu(s) gênero(s)
RIGHT JOIN -> Filmes e seus prêmios (todos os filmes)
Subconsulta -> Conteúdo com maior duração via subquery
Subconsulta c/ AVG -> Contas com planos acima da média de valor
UNION -> Títulos de filmes e séries combinados
INNER JOIN -> Filmes que foram assistidos
UNION ALL + NOT EXISTS -> Filmes que nunca foram assistidos

## Como Executar - MySQL

### 1. Criar o banco e as tabelas
mysql -u root -p < MySQL/tables.sql

### 2. Inserir os dados
mysql -u root -p tf < MySQL/inserts.sql

### 3. Executar as consultas
mysql -u root -p tf < MySQL/selects.sql


## Como Executar - Oracle

sql-- Execute os scripts na seguinte ordem no SQL*Plus ou SQL Developer:
@ORACLE/TrabalhoFinalBD1.sql
@ORACLE/InsertsTrabBD1.sql
@ORACLE/SelectTrabBD1.sql

 ## Etapas do Projeto
O trabalho foi desenvolvido em três fases ao longo do semestre:
Fase 1 — Modelagem Conceitual (30% da nota)
Definição do minimundo, diagrama Entidade-Relacionamento no BRModelo e dicionário de dados.
Fase 2 — Modelagem Lógica (30% da nota)
Conversão do modelo conceitual para o modelo lógico (notação textual e visual), com normalização e mapeamento de chaves.
Fase 3 — Modelagem Física (40% da nota)
Implementação em SQL (Oracle e MySQL), scripts de inserção com no mínimo 10 registros por tabela e 10+ consultas cobrindo os requisitos mínimos.

## Tecnologias
Oracle
MySQL
SQL

## Informações Acadêmicas
Instituição -> Pontifícia Universidade Católica do Rio Grande do Sul — PUCRS
Disciplina  -> Banco de Dados I
Professor   -> Lucas Rafael Costella Pessutto
Semestre    -> 2025/2
Colegas que contribuiram -> André Luiz Goi Quatrin, Gabriela C. Federhen de Carvalho e Gabriel Farias Maxwell
