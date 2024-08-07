-- 1) Retorna da tabela "produto" as linhas onde o valor na coluna descricao contenha "Vestido"
SELECT * from produto
WHERE descricao LIKE 'Vestido'

-- 2) Retorna da tabela "cliente" as linhas onde o valor na coluna descricao contenha "111.111.111-11"
SELECT * FROM cliente
WHERE cpf LIKE '111.111.111-11'

-- 3)Retorna da tabela "produto" onde a descrição do produto seja "Chinelo" e a descrição na tabela cor seja "Verde"
SELECT * FROM produto p
JOIN cor c ON p.fk_cor_codigo = c.codigo
WHERE p.descricao LIKE '%Chinelo%' AND c.descricao LIKE '%Verde%';

-- 4) Retorna da tabela "cliente" as linhas onde o valor na coluna nome contenha "jo" como foi feita com "ILIKE"
--     os retornos serão feitos sem diferenciar letras maiusculas e minúsculas

SELECT * from cliente c
WHERE nome ILIKE 'jo%'

-- 5) Retorna da tabela "cliente" as linhas onde o valor na coluna nome contenha "silva" como foi feita com "ILIKE"
--     os retornos serão feitos sem diferenciar letras maiusculas e minúsculas
SELECT * from cliente c
WHERE nome iLIKE '%silva'

-- 6)Retorna da tabela "produto" onde a descrição do produto seja "Chinelo" e a descrição na tabela cor seja "(11)"
SELECT * from cliente c
WHERE telefone LIKE '(11)%'

-- 7) Compras realizadas no ano atual
SELECT
    codigo,
    data_compra,
    fk_cliente_codigo
FROM
    compra
WHERE
    EXTRACT(YEAR FROM data_compra) = EXTRACT(YEAR FROM CURRENT_DATE);

-- 8) Retorna as compras realizadas no mês atual
SELECT
    codigo,
    data_compra,
    fk_cliente_codigo
FROM
    compra
WHERE
    EXTRACT(MONTH FROM data_compra) = EXTRACT(MONTH FROM CURRENT_DATE)
    AND EXTRACT(YEAR FROM data_compra) = EXTRACT(YEAR FROM CURRENT_DATE);

-- 9) Clientes que realizaram compras nos últimos 6 meses
SELECT
    DISTINCT c.nome,
    cl.codigo AS codigo_cliente
FROM
    cliente c
JOIN
    compra cl ON c.codigo = cl.fk_cliente_codigo
WHERE
    cl.data_compra >= (CURRENT_DATE - INTERVAL '6 months');

-- 10) Pagamentos futuros (vencimentos após a data atual)
SELECT
    codigo,
    data_vencimento,
    valor
FROM
    pagamento
WHERE
    data_vencimento > CURRENT_DATE;

-- 11) Produtos comprados no ano passado
SELECT
    p.codigo AS codigo_produto,
    p.descricao AS descricao_produto,
    ci.quantidade,
    co.data_compra
FROM
    compra co
JOIN
    compra_item ci ON co.codigo = ci.fk_compra_codigo
JOIN
    produto p ON ci.fk_produto_codigo = p.codigo
WHERE
    EXTRACT(YEAR FROM co.data_compra) = EXTRACT(YEAR FROM CURRENT_DATE) - 1;

-- 12) Compras nos últimos 365 dias e o tempo decorrido desde a compra
SELECT
    c.codigo AS codigo_compra,
    c.data_compra,
    CURRENT_DATE - c.data_compra AS dias_desde_compra,
    cl.nome AS nome_cliente
FROM
    compra c
JOIN
    cliente cl ON c.fk_cliente_codigo = cl.codigo
WHERE
    (CURRENT_DATE - c.data_compra) <= 365;