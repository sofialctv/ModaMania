-- TABELAS RELATIVAS A PRODUTO

CREATE TABLE publico_alvo (
    codigo SERIAL PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL
);

CREATE TABLE subcategoria (
    codigo SERIAL PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL
);


CREATE TABLE tamanho (
    codigo SERIAL PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL
);

CREATE TABLE cor (
    codigo SERIAL PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL
);

CREATE TABLE categoria (
    codigo SERIAL PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL
);

CREATE TABLE produto (
    codigo SERIAL PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    preco INTEGER NOT NULL,  	

    fk_cor_codigo INTEGER REFERENCES cor(codigo),
    fk_categoria_codigo INTEGER REFERENCES categoria(codigo),
    fk_tamanho_codigo INTEGER REFERENCES tamanho(codigo),
    fk_publico_alvo_codigo INTEGER REFERENCES publico_alvo(codigo),
    fk_subcategoria_codigo INTEGER REFERENCES subcategoria(codigo)
);

CREATE TABLE estoque (
    codigo SERIAL PRIMARY KEY,
    quantidade INTEGER,
    fk_produto_codigo INTEGER REFERENCES produto(codigo)
);

-- TABELAS RELATIVAS AO CLIENTE

CREATE TABLE cliente (
    codigo SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(255) NOT NULL,
    telefone VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
	inadimplencia BOOLEAN
);

-- TABELAS RELATIVAS A COMPRA

CREATE TABLE compra ( -- Tabela que relaciona produtos comprados por um cliente
    codigo SERIAL PRIMARY KEY,
    data_compra DATE,
    fk_cliente_codigo INTEGER REFERENCES cliente(codigo)
);

CREATE TABLE compra_item (
    codigo SERIAL PRIMARY KEY,
  	valor NUMERIC,
    quantidade INTEGER,
    fk_compra_codigo INTEGER REFERENCES compra(codigo),
    fk_produto_codigo INTEGER REFERENCES produto(codigo)
);

CREATE TABLE metodo_pagamento (
    codigo SERIAL PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL
);

CREATE TABLE status_pagamento (
    codigo SERIAL PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL
);

CREATE TABLE pagamento (
    codigo SERIAL PRIMARY KEY,
    data_vencimento DATE,
    data_pagamento DATE,
    valor NUMERIC,
    parcela INTEGER,
    fk_metodo_pagamento_codigo INTEGER REFERENCES metodo_pagamento(codigo),
    fk_status_pagamento_codigo INTEGER REFERENCES status_pagamento(codigo),
    fk_compra_codigo INTEGER REFERENCES compra(codigo)
);

ALTER SEQUENCE publico_alvo_codigo_seq RESTART WITH 1;
ALTER SEQUENCE subcategoria_codigo_seq RESTART WITH 1;
ALTER SEQUENCE tamanho_codigo_seq RESTART WITH 1;
ALTER SEQUENCE cor_codigo_seq RESTART WITH 1;
ALTER SEQUENCE categoria_codigo_seq RESTART WITH 1;
ALTER SEQUENCE produto_codigo_seq RESTART WITH 1;
ALTER SEQUENCE estoque_codigo_seq RESTART WITH 1;
ALTER SEQUENCE cliente_codigo_seq RESTART WITH 1;
ALTER SEQUENCE compra_codigo_seq RESTART WITH 1;
ALTER SEQUENCE compra_item_codigo_seq RESTART WITH 1;
ALTER SEQUENCE metodo_pagamento_codigo_seq RESTART WITH 1;
ALTER SEQUENCE status_pagamento_codigo_seq RESTART WITH 1;
ALTER SEQUENCE pagamento_codigo_seq RESTART WITH 1;
