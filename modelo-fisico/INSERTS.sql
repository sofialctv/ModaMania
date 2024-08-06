-- Inserindo dados na tabela publico_alvo
INSERT INTO publico_alvo (codigo, descricao) VALUES
(1, 'Adulto'),
(2, 'Infantil');

-- Inserindo dados na tabela subcategoria
INSERT INTO subcategoria (codigo, descricao) VALUES
(1, 'Feminino'),
(2, 'Masculino');

-- Inserindo dados na tabela tamanho
INSERT INTO tamanho (codigo, descricao) VALUES
(1, 'PP'),
(2, 'P'),
(3, 'M'),
(4, 'G'),
(5, 'GG'),
(6, 'Infantil'),
(7, '34'),
(8, '36'),
(9, '38'),
(10, '40'),
(11, '42');

-- Inserindo dados na tabela cor
INSERT INTO cor (codigo, descricao) VALUES
(1, 'Vermelho'),
(2, 'Azul'),
(3, 'Verde'),
(4, 'Amarelo'),
(5, 'Preto'),
(6, 'Branco'),
(7, 'Cinza'),
(8, 'Rosa'),
(9, 'Marrom'),
(10, 'Bege');

-- Inserindo dados na tabela categoria
INSERT INTO categoria (codigo, descricao) VALUES
(1, 'Roupa'),
(2, 'Calçado');

-- Inserindo dados na tabela produto
INSERT INTO produto (codigo, descricao, preco, fk_cor_codigo, fk_categoria_codigo, fk_tamanho_codigo, fk_publico_alvo_codigo, fk_subcategoria_codigo) VALUES
(1, 'Vestido', 599, 1, 1, 4, 1, 1),
(2, 'Blusa', 70, 2, 1, 2, 1, 1),
(3, 'Camisa', 50, 3, 1, 1, 1, 2),
(4, 'Moletom', 150, 4, 1, 4, 2, 2),
(5, 'Casaco', 300, 5, 1, 4, 1, 1),
(6, 'Jaqueta', 250, 6, 1, 3, 2, 1),
(7, 'Saia', 40, 7, 1, 5, 1, 1),
(8, 'Short', 90, 8, 1, 3, 2, 2),
(9, 'Bermuda', 100, 9, 1, 3, 2, 2),
(10, 'Calça', 180, 10, 1, 2, 2, 2),
(11, 'Calça Jeans', 200, 1, 1, 2, 2, 2),
(12, 'Bota', 400, 2, 2, 6, 1, 2),
(13, 'Chinelo', 20, 3, 2, 5, 2, 2),
(14, 'Tênis', 150, 4, 2, 6, 2, 1),
(15, 'Sandália', 70, 5, 2, 6, 1, 1);

-- Inserindo dados na tabela estoque
INSERT INTO estoque (codigo, quantidade, fk_produto_codigo) VALUES
(1, 50, 1),
(2, 40, 2),
(3, 30, 3),
(4, 20, 4),
(5, 10, 5),
(6, 60, 6),
(7, 70, 7),
(8, 80, 8),
(9, 90, 9),
(10, 100, 10),
(11, 110, 11),
(12, 120, 12),
(13, 130, 13),
(14, 140, 14),
(15, 150, 15);

-- Inserindo dados na tabela cliente
INSERT INTO cliente (codigo, nome, cpf, telefone, email, inadimplencia) VALUES
(1, 'João Silva', '111.111.111-11', '(11) 999999999', 'joao@modamania.com', FALSE),
(2, 'Maria Souza', '222.222.222-22', '(11) 988888888', 'maria@modamania.com', FALSE),
(3, 'Carlos Pereira', '333.333.333-33', '(11) 977777777', 'carlos@modamania.com', TRUE),
(4, 'Ana Lima', '444.444.444-44', '(11) 966666666', 'ana@modamania.com', FALSE),
(5, 'Bruno Santos', '555.555.555-55', '(11) 955555555', 'bruno@modamania.com', FALSE),
(6, 'Fernanda Oliveira', '666.666.666-66', '(11) 944444444', 'fernanda@modamania.com', TRUE),
(7, 'Ricardo Costa', '777.777.777-77', '(11) 933333333', 'ricardo@modamania.com', FALSE),
(8, 'Patricia Almeida', '888.888.888-88', '(11) 922222222', 'patricia@modamania.com', FALSE),
(9, 'Gustavo Barbosa', '999.999.999-99', '(11) 911111111', 'gustavo@modamania.com', FALSE),
(10, 'Juliana Martins', '101.010.101-01', '(11) 900000000', 'juliana@modamania.com', FALSE);

-- Inserindo dados na tabela compra
INSERT INTO compra (codigo, data_compra, fk_cliente_codigo) VALUES
(1, '2022-01-05', 1),
(2, '2022-02-15', 2),
(3, '2022-03-20', 3),
(4, '2022-04-25', 4),
(5, '2022-05-10', 5),
(6, '2022-06-30', 6),
(7, '2022-07-22', 7),
(8, '2022-08-19', 8),
(9, '2022-09-08', 9),
(10, '2022-10-13', 10),
(11, '2022-11-24', 1),
(12, '2022-12-31', 2),
(13, '2023-01-12', 3),
(14, '2023-02-18', 4),
(15, '2023-03-29', 5),
(16, '2023-04-04', 6),
(17, '2023-05-15', 7),
(18, '2023-06-21', 8),
(19, '2023-07-11', 9),
(20, '2023-08-27', 10),
(21, '2023-09-09', 1),
(22, '2023-10-20', 2),
(23, '2023-11-05', 3),
(24, '2023-12-14', 4),
(25, '2024-01-22', 5),
(26, '2024-02-10', 6),
(27, '2024-03-18', 7),
(28, '2024-04-06', 8),
(29, '2024-05-25', 9),
(30, '2024-06-13', 10),
(31, '2024-07-01', 1),
(32, '2024-08-19', 2),
(33, '2024-09-07', 3),
(34, '2024-10-15', 4),
(35, '2024-11-23', 5);

-- Inserindo dados na tabela compra_item
INSERT INTO compra_item (codigo, valor, quantidade, fk_compra_codigo, fk_produto_codigo) VALUES
(1, 5000, 1, 1, 1),
(2, 8000, 1, 2, 2),
(3, 3000, 1, 3, 3),
(4, 6000, 1, 4, 4),
(5, 4000, 1, 5, 5),
(6, 2000, 1, 6, 6),
(7, 10000, 1, 7, 7),
(8, 12000, 1, 8, 8),
(9, 1500, 1, 9, 9),
(10, 7000, 1, 10, 10),
(11, 4500, 1, 11, 11),
(12, 5500, 1, 12, 12),
(13, 2300, 1, 13, 13),
(14, 3100, 1, 14, 14),
(15, 2900, 1, 15, 15),
(16, 4700, 1, 16, 1),
(17, 8200, 1, 17, 2),
(18, 3300, 1, 18, 3),
(19, 6200, 1, 19, 4),
(20, 4100, 1, 20, 5),
(21, 2800, 1, 21, 6),
(22, 10050, 1, 22, 7),
(23, 12100, 1, 23, 8),
(24, 1550, 1, 24, 9),
(25, 7050, 1, 25, 10),
(26, 4550, 1, 26, 11),
(27, 5550, 1, 27, 12),
(28, 2350, 1, 28, 13),
(29, 3150, 1, 29, 14),
(30, 2950, 1, 30, 15),
(31, 4600, 1, 1, 1),
(32, 8100, 1, 2, 2),
(33, 3400, 1, 3, 3),
(34, 6100, 1, 4, 4),
(35, 4200, 1, 5, 5);

-- Inserindo dados na tabela metodo_pagamento
INSERT INTO metodo_pagamento (codigo, descricao) VALUES
(1, 'Cartão de Crédito'),
(2, 'Cartão de Débito'),
(3, 'Pix'),
(4, 'Dinheiro');

-- Inserindo dados na tabela status_pagamento
INSERT INTO status_pagamento (codigo, descricao) VALUES
(1, 'Pago'),
(2, 'Em Andamento'),
(3, 'Atrasado');

-- Inserindo dados na tabela pagamento
INSERT INTO pagamento (codigo, data_vencimento, data_pagamento, valor, parcela, fk_metodo_pagamento_codigo, fk_status_pagamento_codigo, fk_compra_codigo) VALUES
(1, '2022-02-05', '2022-02-05', 5000, 1, 1, 1, 1),
(2, '2022-03-12', '2022-03-12', 8000, 1, 2, 1, 2),
(3, '2022-04-19', '2022-04-19', 3000, 1, 3, 1, 3),
(4, '2022-05-22', '2022-05-22', 6000, 1, 4, 1, 4),
(5, '2022-06-11', '2022-06-11', 4000, 1, 1, 2, 5),
(6, '2022-07-07', '2022-07-07', 2000, 1, 2, 2, 6),
(7, '2022-08-15', '2022-08-15', 10000, 2, 3, 2, 7),
(8, '2022-09-30', '2022-09-30', 12000, 2, 4, 2, 8),
(9, '2022-10-21', '2022-10-21', 1500, 2, 1, 3, 9),
(10, '2022-11-14', '2022-11-14', 7000, 2, 2, 3, 10),
(11, '2023-01-10', '2023-01-10', 4500, 2, 3, 1, 11),
(12, '2023-02-25', '2023-02-25', 5500, 3, 4, 1, 12),
(13, '2023-03-05', '2023-03-05', 2300, 3, 1, 1, 13),
(14, '2023-04-18', '2023-04-18', 3100, 3, 2, 1, 14),
(15, '2023-05-11', '2023-05-11', 2900, 3, 3, 2, 15),
(16, '2023-06-27', '2023-06-27', 4700, 4, 4, 2, 16),
(17, '2023-07-19', '2023-07-19', 8200, 4, 1, 2, 17),
(18, '2023-08-14', '2023-08-14', 3300, 4, 2, 2, 18),
(19, '2023-09-23', '2023-09-23', 6200, 4, 3, 2, 19),
(20, '2023-10-08', '2023-10-08', 4100, 4, 4, 2, 20),
(21, '2023-11-30', '2023-11-30', 2800, 5, 1, 3, 21),
(22, '2023-12-07', '2023-12-07', 10050, 5, 2, 3, 22),
(23, '2024-01-16', '2024-01-16', 12100, 5, 3, 3, 23),
(24, '2024-02-05', '2024-02-05', 1550, 5, 4, 3, 24),
(25, '2024-03-18', '2024-03-18', 7050, 5, 1, 1, 25),
(26, '2024-04-25', '2024-04-25', 4550, 6, 2, 1, 26),
(27, '2024-05-11', '2024-05-11', 5550, 6, 3, 1, 27),
(28, '2024-06-06', '2024-06-06', 2350, 7, 4, 1, 28),
(29, '2024-07-21', '2024-07-21', 3150, 8, 1, 2, 29),
(30, '2024-08-28', '2024-08-28', 2950, 8, 2, 2, 30),
(31, '2024-09-09', '2024-09-09', 4600, 9, 3, 2, 31),
(32, '2024-10-22', '2024-10-22', 8100, 10, 4, 2, 32),
(33, '2024-11-05', '2024-11-05', 3400, 11, 1, 3, 33),
(34, '2024-12-16', '2024-12-16', 6100, 12, 2, 3, 34),
(35, '2024-12-29', '2024-12-29', 4200, 12, 3, 3, 35);