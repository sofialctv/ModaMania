-- 6.5 INSTRUÇÕES APLICANDO ATUALIZAÇÃO E EXCLUSÃO DE DADOS (Mínimo 6)

-- 1) Excluindo a cor Roxo
DELETE FROM cor
WHERE descricao LIKE 'Roxo';

-- 2) Excluindo produtos que possuem cor Branco (Id = 6 na tabela de cores)
DELETE FROM produto
WHERE fk_cor_codigo = 6;

-- 3) Excluindo um cliente pelo seu Id
DELETE FROM cliente
WHERE codigo = 5;

-- 4) Acrescentando 10% do valor atual em produtos da categoria "Calçado"
UPDATE produto
SET preco = preco * 1.10
WHERE fk_categoria_codigo = (SELECT codigo FROM categoria WHERE descricao = 'Calçado');

-- 5) Atualizando a quantidade de estoque do produto com codigo 10 para 120.
UPDATE estoque
SET quantidade = 120
WHERE fk_produto_codigo = 10;

-- 6) Atualizando o status de pagamento da compra com codigo 5 para "Pago"
UPDATE pagamento
SET fk_status_pagamento_codigo = 1
WHERE codigo = 5;
