-- A seguir as consultas em relação a base de dados
-- do trabalho de bando de dados 1


-- Consulta ordenando atributo textual, ordem decrescente 
SELECT *
FROM GENERO
ORDER BY nome DESC;

-- Consultas de funções de agregação 
SELECT COUNT(*) AS total_conteudos
FROM CONTEUDO;

SELECT SUM(valorAnual) AS soma_valores_anuais
FROM PLANO;

SELECT MAX(duracaoMin) AS maior_duracao
FROM CONTEUDO;

SELECT MIN(valorMensal) AS menor_valor_mensal
FROM PLANO;

SELECT AVG(nota) AS media_notas
FROM ASSISTE;

--Consulta unindo duas tabelas com relação 1:N ou N:N
SELECT f.premio, c.titulo
FROM FILME f
JOIN CONTEUDO c ON c.cod = f.conteudoCod;

SELECT e.nome AS ator, c.titulo
FROM ATUAM a
JOIN ELENCO e ON e.id = a.elencoId
JOIN CONTEUDO c ON c.cod = a.conteudoCod;

-- Consulta usando BETWEEN e IN 
SELECT titulo, anoLancamento
FROM CONTEUDO
WHERE anoLancamento BETWEEN DATE '2010-01-01' AND DATE '2020-12-31';

SELECT *
FROM GENERO
WHERE nome IN ('Ação', 'Drama', 'Suspense');

-- Consultas usando JOIN 
SELECT p.nome AS perfil, c.email, c.nome AS donoConta
FROM PERFIL p
INNER JOIN CONTA c ON c.cpf = p.contaCpf;

SELECT c.titulo, g.nome AS genero
FROM CONTEUDO c
LEFT JOIN CLASSIFICACAO cl ON cl.conteudoCod = c.cod
LEFT JOIN GENERO g ON g.cod = cl.generoCod;

SELECT f.premio, c.titulo
FROM CONTEUDO c
RIGHT JOIN FILME f
    ON f.conteudoCod = c.cod;

-- Subconsulta usando agregação 
SELECT titulo, duracaoMin
FROM CONTEUDO
WHERE duracaoMin = (
    SELECT MAX(duracaoMin)
    FROM CONTEUDO
);

SELECT nome, email, planoCod
FROM CONTA
WHERE planoCod IN (
    SELECT cod
    FROM PLANO
    WHERE valorMensal > (SELECT AVG(valorMensal) FROM PLANO)
);

-- Consulta com operadores de conjunto (UNION, INTERSECT, MINUS)
SELECT c.titulo
FROM CONTEUDO c
JOIN FILME f ON f.conteudoCod = c.cod

UNION

SELECT c.titulo
FROM CONTEUDO c
JOIN SERIE s ON s.conteudoCod = c.cod;

SELECT conteudoCod
FROM ASSISTE

INTERSECT

SELECT conteudoCod
FROM FILME;

SELECT 
    TO_CHAR(f.conteudoCod) AS FilmeNaoAssistido
FROM FILME f
WHERE NOT EXISTS (
    SELECT 1
    FROM ASSISTE a
    WHERE a.conteudoCod = f.conteudoCod
)

UNION ALL

SELECT 'Nenhum filme sem assistir'
FROM DUAL
WHERE NOT EXISTS (
    SELECT 1
    FROM FILME ff
    WHERE NOT EXISTS (
        SELECT 1
        FROM ASSISTE aa
        WHERE aa.conteudoCod = ff.conteudoCod
    )
);

