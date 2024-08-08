-- 1) Compras realizadas pelo mesmo cliente em datas diferentes
SELECT
    c1.codigo AS compra1_codigo,
    c1.data_compra AS compra1_data,
    c2.codigo AS compra2_codigo,
    c2.data_compra AS compra2_data,
    cliente.nome AS cliente_nome
FROM
    compra c1
JOIN
    compra c2 ON c1.fk_cliente_codigo = c2.fk_cliente_codigo
            AND c1.data_compra <> c2.data_compra
JOIN
    cliente ON c1.fk_cliente_codigo = cliente.codigo
WHERE
    c1.codigo < c2.codigo;

-- 2) Self Join na tabela cliente para encontrar clientes com o mesmo telefone
SELECT
c1.codigo AS codigo_cliente_1,
c1.nome AS nome_cliente_1,
c2.codigo AS codigo_cliente_2,
c2.nome AS nome_cliente_2,
c1.telefone
FROM cliente c1
JOIN cliente c2 ON c1.telefone = c2.telefone
WHERE c1.codigo <> c2.codigo;

-- 3) Consulta que identifica pagamentos que estão em atraso
CREATE VIEW pagamentos_pendentes AS
SELECT
    pagamento.codigo AS pagamento_codigo,
    pagamento.data_vencimento,
    pagamento.data_pagamento,
    pagamento.valor,
    cliente.nome AS cliente_nome,
    metodo_pagamento.descricao AS metodo_pagamento,
    status_pagamento.descricao AS status_pagamento
FROM
    pagamento
JOIN
    compra ON pagamento.fk_compra_codigo = compra.codigo
JOIN
    cliente ON compra.fk_cliente_codigo = cliente.codigo
JOIN
    metodo_pagamento ON pagamento.fk_metodo_pagamento_codigo = metodo_pagamento.codigo
JOIN
    status_pagamento ON pagamento.fk_status_pagamento_codigo = status_pagamento.codigo
WHERE
    status_pagamento.descricao = 'Atrasado';

SELECT * FROM pagamentos_pendentes
ORDER BY data_vencimento DESC;

-- 5) View dos produtos mais vendidos
CREATE VIEW view_produtos_mais_vendidos AS
SELECT
    p.descricao AS descricao_produto,
    SUM(ci.quantidade) AS quantidade_total_vendida
FROM compra_item ci
JOIN produto p ON ci.fk_produto_codigo = p.codigo
GROUP BY p.descricao
ORDER BY quantidade_total_vendida DESC;

SELECT * FROM view_produtos_mais_vendidos;

-- 6) Compras de clientes que compraram mais de uma vez no mesmo dia
CREATE VIEW compras_mesmo_dia AS
SELECT
c1.codigo AS compra1_codigo,
c1.data_compra AS compra1_data,
c2.codigo AS compra2_codigo,
c2.data_compra AS compra2_data,
cliente.nome AS cliente_nome
FROM
compra c1
JOIN
compra c2 ON c1.fk_cliente_codigo = c2.fk_cliente_codigo
        AND c1.data_compra = c2.data_compra
        AND c1.codigo < c2.codigo
JOIN
cliente ON c1.fk_cliente_codigo = cliente.codigo;

SELECT * FROM compras_mesmo_dia;