-- TABELAS RELATIVAS A PRODUTO

DROP TABLE IF EXISTS publico_alvo
CREATE TABLE publico_alvo (
    codigo INT PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS subcategoria
CREATE TABLE subcategoria (
    codigo INT PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS tamanho
CREATE TABLE tamanho (
    codigo INT PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS cor
CREATE TABLE cor (
    codigo INT PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS categoria
CREATE TABLE categoria (
    codigo INT PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS produto
CREATE TABLE produto (
    codigo INT PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    preco INTEGER NOT NULL,  	

    fk_cor_codigo INTEGER REFERENCES cor(codigo),
    fk_categoria_codigo INTEGER REFERENCES categoria(codigo),
    fk_tamanho_codigo INTEGER REFERENCES tamanho(codigo),
    fk_publico_alvo_codigo INTEGER REFERENCES publico_alvo(codigo),
    fk_subcategoria_codigo INTEGER REFERENCES subcategoria(codigo)
);

DROP TABLE IF EXISTS estoque
CREATE TABLE estoque (
    codigo INT PRIMARY KEY,
    quantidade INTEGER,
    fk_produto_codigo INTEGER REFERENCES produto(codigo)
);

-- TABELAS RELATIVAS AO CLIENTE
DROP TABLE IF EXISTS cliente
CREATE TABLE cliente (
    codigo INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(255) NOT NULL,
    telefone VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
	inadimplencia BOOLEAN
);

-- TABELAS RELATIVAS A COMPRA
DROP TABLE IF EXISTS compra
CREATE TABLE compra ( -- Tabela que relaciona produtos comprados por um cliente
    codigo INT PRIMARY KEY,
    data_compra DATE,
    fk_cliente_codigo INTEGER REFERENCES cliente(codigo)
);

DROP TABLE IF EXISTS compra_item
CREATE TABLE compra_item (
    codigo INT PRIMARY KEY,
  	valor NUMERIC,
    quantidade INTEGER,
    fk_compra_codigo INTEGER REFERENCES compra(codigo),
    fk_produto_codigo INTEGER REFERENCES produto(codigo)
);

DROP TABLE IF EXISTS metodo_pagamento
CREATE TABLE metodo_pagamento (
    codigo INT PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS status_pagamento
CREATE TABLE status_pagamento (
    codigo INT PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS pagamento
CREATE TABLE pagamento (
    codigo INT PRIMARY KEY,
    data_vencimento DATE,
    data_pagamento DATE,
    valor NUMERIC,
    parcela INTEGER,
    fk_metodo_pagamento_codigo INTEGER REFERENCES metodo_pagamento(codigo),
    fk_status_pagamento_codigo INTEGER REFERENCES status_pagamento(codigo),
    fk_compra_codigo INTEGER REFERENCES compra(codigo)
);