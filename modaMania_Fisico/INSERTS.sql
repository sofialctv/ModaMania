-- Inserindo dados na tabela publico_alvo
INSERT INTO publico_alvo (descricao) VALUES
('Adulto'),
('Infantil');

select * from publico_alvo

-- Inserindo dados na tabela subcategoria
INSERT INTO subcategoria (descricao) VALUES
('Feminino'),
('Masculino');

select * from subcategoria

-- Inserindo dados na tabela tamanho
INSERT INTO tamanho (descricao) VALUES
('PP'),
('P'),
('M'),
('G'),
('GG'),
('Infantil'),
('34'),
('36'),
('38'),
('40'),
('42');

select * from tamanho

-- Inserindo dados na tabela cor
INSERT INTO cor (descricao) VALUES
('Vermelho'),
('Azul'),
('Verde'),
('Amarelo'),
('Preto'),
('Branco'),
('Cinza'),
('Rosa'),
('Marrom'),
('Bege');

select * from cor

-- Inserindo dados na tabela categoria
INSERT INTO categoria (descricao) VALUES
('Roupa'),
('Calçado');

select * from categoria

-- Inserindo dados na tabela produto
INSERT INTO produto (descricao, preco, fk_cor_codigo, fk_categoria_codigo, fk_tamanho_codigo, fk_publico_alvo_codigo, fk_subcategoria_codigo) VALUES
('Camisa', 50, 1, 1, 1, 1, 1),
('Calça', 180, 2, 1, 2, 2, 2),
('Shorts', 120, 3, 1, 3, 2, 1),
('Vestido', 599, 4, 1, 4, 1, 2),
('Saia', 40, 5, 2, 5, 1, 1),
('Tênis', 200, 6, 2, 6, 2, 2);

select * from produto

-- Inserindo dados na tabela estoque
INSERT INTO estoque (quantidade, fk_produto_codigo) VALUES
(50, 1),
(40, 2),
(30, 3),
(20, 4),
(10, 5),
(60, 6);

select * from estoque

-- Inserindo dados na tabela cliente
INSERT INTO cliente (nome, cpf, telefone, email, inadimplencia) VALUES
('João Silva', '11111111111', '11999999999', 'joao@modamania.com', FALSE),
('Maria Souza', '22222222222', '11988888888', 'maria@modamania.com', FALSE),
('Carlos Pereira', '33333333333', '11977777777', 'carlos@modamania.com', TRUE),
('Ana Lima', '44444444444', '11966666666', 'ana@modamania.com', FALSE),
('Bruno Santos', '55555555555', '11955555555', 'bruno@modamania.com', FALSE),
('Fernanda Oliveira', '66666666666', '11944444444', 'fernanda@modamania.com', TRUE),
('Ricardo Costa', '77777777777', '11933333333', 'ricardo@modamania.com', FALSE),
('Patricia Almeida', '88888888888', '11922222222', 'patricia@modamania.com', FALSE),
('Gustavo Barbosa', '99999999999', '11911111111', 'gustavo@modamania.com', FALSE),
('Juliana Martins', '10101010101', '11900000000', 'juliana@modamania.com', FALSE);

select * from cliente

-- Inserindo dados na tabela compra
INSERT INTO compra (data_compra, fk_cliente_codigo) VALUES
('2023-01-01', 1),
('2023-02-01', 2),
('2023-03-01', 3),
('2023-04-01', 4),
('2023-05-01', 5),
('2023-06-01', 6),
('2023-07-01', 7),
('2023-08-01', 8),
('2023-09-01', 9),
('2023-10-01', 10);

select * from compra

-- Inserindo dados na tabela compra_item
INSERT INTO compra_item (valor, quantidade, fk_compra_codigo, fk_produto_codigo) VALUES
(5000, 1, 1, 1),
(8000, 1, 2, 2),
(3000, 1, 3, 3),
(6000, 1, 4, 4),
(4000, 1, 5, 5),
(2000, 1, 6, 5),
(10000, 1, 7, 4),
(12000, 1, 8, 3),
(1500, 1, 9, 2),
(7000, 1, 10, 1);

select * from compra_item

-- Inserindo dados na tabela metodo_pagamento
INSERT INTO metodo_pagamento (descricao) VALUES
('Cartão de Crédito'),
('Cartão de Débito'),
('Pix'),
('Dinheiro');

select * from metodo_pagamento

-- Inserindo dados na tabela status_pagamento
INSERT INTO status_pagamento (descricao) VALUES
('Pago'),
('Em Andamento'),
('Atrasado');

select * from status_pagamento

-- Inserindo dados na tabela pagamento
INSERT INTO pagamento (data_vencimento, data_pagamento, valor, parcela, fk_metodo_pagamento_codigo, fk_status_pagamento_codigo, fk_compra_codigo) VALUES
('2023-02-01', '2023-02-01', 5000, 1, 1, 2, 1),
('2023-03-01', '2023-03-01', 8000, 1, 2, 2, 2),
('2023-04-01', '2023-04-01', 3000, 1, 3, 2, 3),
('2023-05-01', '2023-05-01', 6000, 1, 4, 2, 4),
('2023-06-01', '2023-06-01', 4000, 1, 4, 2, 5),
('2023-07-01', '2023-07-01', 2000, 1, 3, 2, 6),
('2023-08-01', '2023-08-01', 10000, 1, 2, 2, 7),
('2023-09-01', '2023-09-01', 12000, 1, 1, 2, 8),
('2023-10-01', '2023-10-01', 1500, 1, 1, 2, 9),
('2023-11-01', '2023-11-01', 7000, 1, 2, 2, 10);

select * from pagamento