-- 1) Consultando produtos que custam entre R$100 e R$1.000
SELECT descricao AS Produto, preco AS Preço_Do_Produto
FROM produto
WHERE preco BETWEEN 100 AND 1000;

-- 2) Consultando produtos da categoria 'Roupa' ou público-alvo 'Adulto'
SELECT p.descricao AS Produto, p.preco AS Preço_Do_Produto
FROM produto p
JOIN categoria c ON p.fk_categoria_codigo = c.codigo
JOIN publico_alvo pa ON p.fk_publico_alvo_codigo = pa.codigo
WHERE c.descricao = 'Roupa' OR pa.descricao = 'Adulto';

-- 3) Consultando o valor total das compras
SELECT SUM(ci.valor * ci.quantidade) AS Valor_Total_das_Compras
FROM compra c
JOIN compra_item ci ON c.codigo = ci.fk_compra_codigo;

-- 4) Consultando o estoque de cada produto que possui mais de 100 itens armazenados
SELECT e.quantidade AS Qtd_em_Estoque, p.descricao AS Produto
FROM estoque e
JOIN produto p ON e.fk_produto_codigo = p.codigo
WHERE e.quantidade > 100;

-- 5) Consultando os clientes que realizam pagamentos que não sejam pelo método 'Cartão de Débito'
SELECT c.nome AS cliente, p.descricao AS metodo_pagamento, s.descricao AS status_pagamento
FROM pagamento pa
JOIN cliente c ON pa.fk_compra_codigo IN (SELECT codigo FROM compra WHERE fk_cliente_codigo = c.codigo)
JOIN metodo_pagamento p ON pa.fk_metodo_pagamento_codigo = p.codigo
JOIN status_pagamento s ON pa.fk_status_pagamento_codigo = s.codigo
WHERE NOT p.descricao = 'Cartão de Débito';

-- 6) Consultando o valor total dos produtos com base em suas quantidades em estoque
SELECT p.descricao AS produto_nome, e.quantidade AS qtd_em_estoque, (p.preco * e.quantidade) AS valor_total_estoque
FROM produto p
JOIN estoque e ON p.codigo = e.fk_produto_codigo;

-- 7) Consultando o preço de produtos da categoria 'Roupa' que custam menos de R$100 com um acréscimo de 10%
SELECT
    descricao AS produto,
    preco * 1.1 AS preco_com_acrescimo_de_10_por_cento
FROM
    produto
WHERE
    preco < 100 AND fk_categoria_codigo = 1;

-- 8) Consultando o preço de produtos que custam mais de R$100 considerando um desconto de 5%
SELECT
    descricao AS produto,
    preco - (preco * 0.05) AS preco_com_desconto
FROM
    produto
WHERE
    preco > 100;

-- 9) Listando clientes inadimplentes e seus CPFs
SELECT
    nome AS cliente_nome,
    cpf AS cliente_cpf
FROM
    cliente
WHERE
    inadimplencia = TRUE;

-- 10) Consultando o valor total do estoque (preço * quantidade) para produtos com quantidade acima de 50
SELECT
    descricao AS produto,
    preco * quantidade AS valor_total_em_estoque
FROM
    produto, estoque
WHERE
    produto.codigo = estoque.fk_produto_codigo
    AND quantidade > 50;

-- 11) Consultando quantidade em estoque para produtos com uma quantidade entre 20 e 50
SELECT
    p.descricao AS produto,
    e.quantidade AS estoque_disponivel
FROM
    produto p, estoque e
WHERE
    p.codigo = e.fk_produto_codigo
    AND e.quantidade BETWEEN 20 AND 50;