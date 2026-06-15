USE controle_estoque;

-- Preço médio dos produtos cadastrados
SELECT 
    ROUND(AVG(preco), 2) AS preco_medio
FROM produto;

-- Maior e menor preço entre os produtos
SELECT 
    MAX(preco) AS maior_preco,
    MIN(preco) AS menor_preco
FROM produto;

-- Quantidade total e valor total do estoque
SELECT
    SUM(quantidade_estoque) AS quantidade_total_em_estoque,
    ROUND(SUM(preco * quantidade_estoque), 2) AS valor_total_do_estoque
FROM produto;

-- Total de produtos ativos e inativos
SELECT
    CASE 
        WHEN ativo = TRUE THEN 'ATIVO'
        ELSE 'INATIVO'
    END AS status_produto,
    COUNT(*) AS total_produtos
FROM produto
GROUP BY ativo;

-- Estatísticas de preços dos produtos ativos
SELECT
    ROUND(AVG(preco), 2) AS preco_medio,
    MAX(preco) AS maior_preco,
    MIN(preco) AS menor_preco
FROM produto
WHERE ativo = TRUE;

-- Quantidade de usuários por perfil
SELECT
    p.nome AS perfil,
    COUNT(u.id_usuario) AS total_usuarios
FROM perfil p
LEFT JOIN usuario u
    ON u.id_perfil = p.id_perfil
GROUP BY p.id_perfil, p.nome
ORDER BY total_usuarios DESC;

-- Total de usuários ativos e inativos
SELECT
    CASE
        WHEN ativo = TRUE THEN 'ATIVO'
        ELSE 'INATIVO'
    END AS status_usuario,
    COUNT(*) AS total_usuarios
FROM usuario
GROUP BY ativo;

-- Quantidade de movimentações por tipo
SELECT
    tm.nome AS tipo_movimentacao,
    COUNT(me.id_movimentacao_estoque) AS total_movimentacoes
FROM tipo_movimentacao tm
LEFT JOIN movimentacao_estoque me
    ON me.id_tipo_movimentacao = tm.id_tipo_movimentacao
GROUP BY tm.id_tipo_movimentacao, tm.nome
ORDER BY total_movimentacoes DESC;

-- Total de itens movimentados por tipo de movimentação
SELECT
    tm.nome AS tipo_movimentacao,
    SUM(me.quantidade) AS quantidade_total_movimentada
FROM tipo_movimentacao tm
LEFT JOIN movimentacao_estoque me
    ON me.id_tipo_movimentacao = tm.id_tipo_movimentacao
GROUP BY tm.id_tipo_movimentacao, tm.nome
ORDER BY quantidade_total_movimentada DESC;

-- Resumo de lançamentos por tipo de movimentação
SELECT
    tm.nome AS tipo_movimentacao,
    COUNT(me.id_movimentacao_estoque) AS total_lancamentos,
    SUM(me.quantidade) AS total_itens_movimentados
FROM tipo_movimentacao tm
INNER JOIN movimentacao_estoque me
    ON me.id_tipo_movimentacao = tm.id_tipo_movimentacao
GROUP BY tm.id_tipo_movimentacao, tm.nome;

-- Estatísticas gerais das movimentações de estoque
SELECT
    COUNT(*) AS total_movimentacoes,
    SUM(quantidade) AS quantidade_total_movimentada,
    ROUND(AVG(quantidade), 2) AS media_quantidade_por_movimentacao,
    MAX(quantidade) AS maior_quantidade_movimentada,
    MIN(quantidade) AS menor_quantidade_movimentada
FROM movimentacao_estoque;