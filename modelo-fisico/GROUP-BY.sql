-- 1) Calcula o valor total de uma compra
SELECT fk_compra_codigo, SUM(valor) AS total_valor
FROM compra_item
GROUP BY fk_compra_codigo;

-- 2) Consultando a soma do preço dos produtos de cada cor
SELECT
    c.descricao AS Cor_Do_Produto,
    SUM(p.preco) AS Soma_Do_Preços_Por_Cor
FROM
    produto p
JOIN
    cor c ON p.fk_cor_codigo = c.codigo
GROUP BY
    c.descricao
ORDER BY
    c.descricao;

-- 3) Quantidade total de produtos vendidos por categoria
SELECT c.descricao AS categoria, SUM(ci.quantidade) AS total_vendido
FROM compra_item ci
JOIN produto p ON ci.fk_produto_codigo = p.codigo
JOIN categoria c ON p.fk_categoria_codigo = c.codigo
GROUP BY c.descricao;

-- 4) Média de valor gasto por compra por método de pagamento
SELECT mp.descricao AS metodo_pagamento, AVG(pag.valor) AS media_gasto
FROM pagamento pag
JOIN metodo_pagamento mp ON pag.fk_metodo_pagamento_codigo = mp.codigo
GROUP BY mp.descricao;

-- 5) Valor total das compras por cliente
SELECT cl.nome AS cliente, SUM(ci.valor) AS total_gasto
FROM compra_item ci
JOIN compra co ON ci.fk_compra_codigo = co.codigo
JOIN cliente cl ON co.fk_cliente_codigo = cl.codigo
GROUP BY cl.nome;

-- 6) Valor total de compras e quantidade de itens vendidos por produto
SELECT p.descricao AS produto, SUM(ci.valor) AS valor_total, SUM(ci.quantidade) AS quantidade_total
FROM compra_item ci
JOIN produto p ON ci.fk_produto_codigo = p.codigo
GROUP BY p.descricao;
