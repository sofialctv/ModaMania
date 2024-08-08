-- 1) Clientes que realizaram mais de uma compra
SELECT cliente.nome, COUNT(compra.codigo) AS num_compras
FROM cliente
JOIN compra ON cliente.codigo = compra.fk_cliente_codigo
GROUP BY cliente.nome
HAVING COUNT(compra.codigo) > 1;

-- 2) Produtos mais vendidos por categoria
SELECT categoria.descricao AS categoria, produto.descricao AS produto, SUM(compra_item.quantidade) AS total_vendido
FROM categoria
JOIN produto ON categoria.codigo = produto.fk_categoria_codigo
JOIN compra_item ON produto.codigo = compra_item.fk_produto_codigo
GROUP BY categoria.descricao, produto.descricao
ORDER BY categoria.descricao, total_vendido DESC;

-- 3) Clientes com pagamentos em atraso
SELECT cliente.nome, pagamento.data_vencimento, pagamento.valor
FROM cliente
JOIN compra ON cliente.codigo = compra.fk_cliente_codigo
JOIN pagamento ON compra.codigo = pagamento.fk_compra_codigo
WHERE pagamento.fk_status_pagamento_codigo = (SELECT codigo FROM status_pagamento WHERE descricao = 'Atrasado');

-- 4) Clientes que gastaram mais de R$5.000 em suas compras
SELECT cliente.nome, SUM(compra_item.valor * compra_item.quantidade) AS total_gasto
FROM cliente
JOIN compra ON cliente.codigo = compra.fk_cliente_codigo
JOIN compra_item ON compra.codigo = compra_item.fk_compra_codigo
GROUP BY cliente.nome
HAVING SUM(compra_item.valor * compra_item.quantidade) > 5000;
