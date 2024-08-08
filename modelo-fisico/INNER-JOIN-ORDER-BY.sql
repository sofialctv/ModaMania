-- 1) Consulta irá trazer detalhes completos de cada compra, incluindo informações do cliente, produto, estoque, e pagamento.
-- Esta é a junção que envolve todas as tabelas
SELECT
    cliente.nome AS nome_cliente,
    compra.data_compra,
    produto.descricao AS descricao_produto,
    estoque.quantidade AS quantidade_estoque,
    cor.descricao AS cor_produto,
    categoria.descricao AS categoria_produto,
    tamanho.descricao AS tamanho_produto,
    publico_alvo.descricao AS publico_alvo_produto,
    subcategoria.descricao AS subcategoria_produto,
    compra_item.valor AS valor_compra_item,
    compra_item.quantidade AS quantidade_compra_item,
    metodo_pagamento.descricao AS metodo_pagamento,
    status_pagamento.descricao AS status_pagamento,
    pagamento.data_pagamento,
    pagamento.data_vencimento,
    pagamento.valor AS valor_pagamento
FROM
    cliente
INNER JOIN compra ON cliente.codigo = compra.fk_cliente_codigo
INNER JOIN compra_item ON compra.codigo = compra_item.fk_compra_codigo
INNER JOIN produto ON compra_item.fk_produto_codigo = produto.codigo
INNER JOIN cor ON produto.fk_cor_codigo = cor.codigo
INNER JOIN categoria ON produto.fk_categoria_codigo = categoria.codigo
INNER JOIN tamanho ON produto.fk_tamanho_codigo = tamanho.codigo
INNER JOIN publico_alvo ON produto.fk_publico_alvo_codigo = publico_alvo.codigo
INNER JOIN subcategoria ON produto.fk_subcategoria_codigo = subcategoria.codigo
INNER JOIN estoque ON produto.codigo = estoque.fk_produto_codigo
INNER JOIN pagamento ON compra.codigo = pagamento.fk_compra_codigo
INNER JOIN metodo_pagamento ON pagamento.fk_metodo_pagamento_codigo = metodo_pagamento.codigo
INNER JOIN status_pagamento ON pagamento.fk_status_pagamento_codigo = status_pagamento.codigo
ORDER BY compra.data_compra DESC, cliente.nome ASC

-- 2) Consulta de compras mostrando detalhes dos clientes e produtos envolvidos.
SELECT
    cliente.nome AS nome_cliente,
    cliente.email AS email_cliente,
    compra.data_compra,
    produto.descricao AS descricao_produto,
    produto.preco AS preco_produto,
    compra_item.quantidade AS quantidade_comprada
FROM
    cliente
INNER JOIN compra ON cliente.codigo = compra.fk_cliente_codigo
INNER JOIN compra_item ON compra.codigo = compra_item.fk_compra_codigo
INNER JOIN produto ON compra_item.fk_produto_codigo = produto.codigo
ORDER BY compra.data_compra DESC, cliente.nome ASC

-- 3) Consulta para listar clientes que estão inadimplentes, incluindo detalhes de pagamento e status.
SELECT
    cliente.nome AS nome_cliente,
    cliente.email AS email_cliente,
    pagamento.valor AS valor_pagamento,
    pagamento.data_vencimento,
    status_pagamento.descricao AS status_pagamento
FROM
    cliente
INNER JOIN compra ON cliente.codigo = compra.fk_cliente_codigo
INNER JOIN pagamento ON compra.codigo = pagamento.fk_compra_codigo
INNER JOIN status_pagamento ON pagamento.fk_status_pagamento_codigo = status_pagamento.codigo
WHERE cliente.inadimplencia = TRUE
ORDER BY pagamento.data_vencimento ASC, cliente.nome ASC;

-- 4) Consulta que retorna produtos que têm um estoque baixo (menos de 60 unidades)
SELECT
    produto.descricao AS descricao_produto,
    estoque.quantidade AS quantidade_estoque,
    cor.descricao AS cor_produto,
    categoria.descricao AS categoria_produto,
    tamanho.descricao AS tamanho_produto
FROM
    produto
INNER JOIN estoque ON produto.codigo = estoque.fk_produto_codigo
INNER JOIN cor ON produto.fk_cor_codigo = cor.codigo
INNER JOIN categoria ON produto.fk_categoria_codigo = categoria.codigo
INNER JOIN tamanho ON produto.fk_tamanho_codigo = tamanho.codigo
WHERE estoque.quantidade < 60
ORDER BY estoque.quantidade ASC, produto.descricao ASC;

-- 5) Consulta para ver a quantidade de compras e o valor total por método de pagamento.
SELECT
    metodo_pagamento.descricao AS metodo_pagamento,
    COUNT(compra.codigo) AS quantidade_compras,
    SUM(pagamento.valor) AS valor_total
FROM
    compra
INNER JOIN pagamento ON compra.codigo = pagamento.fk_compra_codigo
INNER JOIN metodo_pagamento ON pagamento.fk_metodo_pagamento_codigo = metodo_pagamento.codigo
GROUP BY metodo_pagamento.descricao
ORDER BY valor_total DESC;

-- 6) Consulta para listar os produtos mais vendidos, com a quantidade total vendida.
SELECT
    produto.descricao AS descricao_produto,
    SUM(compra_item.quantidade) AS quantidade_vendida,
    categoria.descricao AS categoria_produto,
    cor.descricao AS cor_produto,
    tamanho.descricao AS tamanho_produto
FROM
    produto
INNER JOIN compra_item ON produto.codigo = compra_item.fk_produto_codigo
INNER JOIN categoria ON produto.fk_categoria_codigo = categoria.codigo
INNER JOIN cor ON produto.fk_cor_codigo = cor.codigo
INNER JOIN tamanho ON produto.fk_tamanho_codigo = tamanho.codigo
GROUP BY produto.descricao, categoria.descricao, cor.descricao, tamanho.descricao
ORDER BY quantidade_vendida DESC, produto.descricao ASC
