# Trabalho Final de Banco de Dados I

🎬 StreamDB — Banco de Dados de Plataforma de Streaming

Trabalho Final — Banco de Dados I | PUCRS
Disciplina ministrada pelo Prof. Lucas Rafael Costella Pessutto


📋 Sobre o Projeto
Modelagem e implementação completa de um banco de dados relacional inspirado em plataformas de streaming de vídeo (como Netflix). O projeto cobre todas as etapas do ciclo de desenvolvimento de um banco de dados: da modelagem conceitual à implementação física com consultas SQL.

🗂️ Estrutura do Repositório
📦 Trabalho_final_BD1/
├── 📁 MySQL/
│   ├── tables.sql       # Criação das tabelas
│   ├── inserts.sql      # Inserção de dados
│   └── selects.sql      # Consultas SQL
├── 📁 ORACLE/
│   ├── TrabalhoFinalBD1.sql    # Criação das tabelas (Oracle)
│   ├── InsertsTrabBD1.sql      # Inserção de dados (Oracle)
│   └── SelectTrabBD1.sql       # Consultas SQL (Oracle)
└── 📄 Relatório TF BDI.pdf     # Relatório completo do projeto

🗃️ Modelo de Dados
O banco representa o domínio de uma plataforma de streaming com as seguintes entidades:
TabelaDescriçãoCONTAUsuário cadastrado na plataforma (CPF, e-mail, endereço, plano)PERFILPerfis vinculados a uma conta (nome, classificação, foto)PLANOPlanos de assinatura disponíveis (mensal/anual)CONTEUDOFilmes e séries disponíveis na plataformaFILMEEspecialização de Conteúdo — dados específicos de filmesSERIEEspecialização de Conteúdo — dados específicos de sériesDIRETORDiretores dos conteúdosELENCOAtores e atrizes do elencoGENEROGêneros cinematográficosASSISTEHistórico de visualização por perfilDISPOSITIVODispositivos usados para acessoPAGAMENTORegistro de pagamentos realizadosATUAMRelacionamento entre elenco e conteúdoCLASSIFICACAORelacionamento entre gênero e conteúdo

💡 Consultas Implementadas
O projeto inclui 18 consultas SQL cobrindo os seguintes recursos:
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

🚀 Como Executar
MySQL
# 1. Criar o banco e as tabelas
mysql -u root -p < MySQL/tables.sql

# 2. Inserir os dados
mysql -u root -p tf < MySQL/inserts.sql

# 3. Executar as consultas
mysql -u root -p tf < MySQL/selects.sql


Oracle
sql-- Execute os scripts na seguinte ordem no SQL*Plus ou SQL Developer:
@ORACLE/TrabalhoFinalBD1.sql
@ORACLE/InsertsTrabBD1.sql
@ORACLE/SelectTrabBD1.sql

📐 Etapas do Projeto
O trabalho foi desenvolvido em três fases ao longo do semestre:
Fase 1 — Modelagem Conceitual (30% da nota)
Definição do minimundo, diagrama Entidade-Relacionamento no BRModelo e dicionário de dados.
Fase 2 — Modelagem Lógica (30% da nota)
Conversão do modelo conceitual para o modelo lógico (notação textual e visual), com normalização e mapeamento de chaves.
Fase 3 — Modelagem Física (40% da nota)
Implementação em SQL (Oracle e MySQL), scripts de inserção com no mínimo 10 registros por tabela e 10+ consultas cobrindo os requisitos mínimos.

🛠️ Tecnologias
Oracle
MySql
Sql

🏫 Informações Acadêmicas
Instituição -> Pontifícia Universidade Católica do Rio Grande do Sul — PUCRS
Disciplina  -> Banco de Dados I
Professor   -> Lucas Rafael Costella Pessutto
Semestre    -> 2025/2
Colegas que contribuiram -> André Luiz Goi Quatrin, Gabriela C. Federhen de Carvalho e Gabriel Farias Maxwell
