-- 6.2 CONSULTAS DAS TABELAS COM FILTROS WHERE (Mínimo 4)

-- 1) Consultando produtos com preço maior ou igual a 100
SELECT descricao AS Produto, preco AS Preço
FROM produto
WHERE preco > 100;

-- 2) Consultando compras realizadas entre setembro e dezembro de 2023
SELECT data_compra, fk_cliente_codigo AS Codigo_Cliente
FROM compra
WHERE data_compra BETWEEN '2023-09-01'AND '2023-12-01'

-- 3) Consultando clientes que não são inadimplentes
SELECT nome AS NomeCliente, cpf, telefone, email
FROM cliente
WHERE inadimplencia = FALSE;

-- 4) Consultando pagamentos realizado pelo método 'Cartão de Crédito'
SELECT data_pagamento, valor AS Valor_A_Pagar, parcela AS Qtd_Parcelas
FROM pagamento
WHERE fk_metodo_pagamento_codigo = (SELECT codigo FROM metodo_pagamento WHERE descricao = 'Cartão de Crédito');