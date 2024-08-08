-- 1) Consulta retorna todos os produtos e suas respectivas cores.
SELECT
    produto.codigo AS produto_codigo,
    produto.descricao AS produto_descricao,
    cor.descricao AS cor_descricao
FROM
    produto
LEFT JOIN
    cor ON produto.fk_cor_codigo = cor.codigo;

-- 2) Consulta exibe todos os métodos de pagamento, incluindo aqueles que não têm compras associadas.
SELECT
    metodo_pagamento.descricao AS metodo_pagamento,
    compra.codigo AS compra_codigo,
    compra.data_compra
FROM
    compra
RIGHT JOIN
    metodo_pagamento ON compra.codigo = metodo_pagamento.codigo;

-- 3) Consulta combina clientes e compras, mostrando todos os clientes, todas as compras, e as associações entre eles.
SELECT
    cliente.codigo AS cliente_codigo,
    cliente.nome AS cliente_nome,
    compra.codigo AS compra_codigo,
    compra.data_compra
FROM
    cliente
FULL JOIN
    compra ON cliente.codigo = compra.fk_cliente_codigo;

-- 4) Consulta todos os produtos e suas subcategorias, e mostra a quantidade em estoque, se houver.
SELECT
    produto.codigo AS produto_codigo,
    produto.descricao AS produto_descricao,
    estoque.quantidade AS quantidade_estoque,
    subcategoria.descricao AS subcategoria_descricao
FROM
    produto
LEFT JOIN
    estoque ON produto.codigo = estoque.fk_produto_codigo
RIGHT JOIN
    subcategoria ON produto.fk_subcategoria_codigo = subcategoria.codigo;
