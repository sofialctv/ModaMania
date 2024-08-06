-- TABELAS RELATIVAS A PRODUTO

CREATE TABLE publico_alvo (
    codigo INT PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL
);

CREATE TABLE subcategoria (
    codigo INT PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL
);


CREATE TABLE tamanho (
    codigo INT PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL
);

CREATE TABLE cor (
    codigo INT PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL
);

CREATE TABLE categoria (
    codigo INT PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL
);

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

CREATE TABLE estoque (
    codigo INT PRIMARY KEY,
    quantidade INTEGER,
    fk_produto_codigo INTEGER REFERENCES produto(codigo)
);

-- TABELAS RELATIVAS AO CLIENTE

CREATE TABLE cliente (
    codigo INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(255) NOT NULL,
    telefone VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
	inadimplencia BOOLEAN
);

-- TABELAS RELATIVAS A COMPRA

CREATE TABLE compra ( -- Tabela que relaciona produtos comprados por um cliente
    codigo INT PRIMARY KEY,
    data_compra DATE,
    fk_cliente_codigo INTEGER REFERENCES cliente(codigo)
);

CREATE TABLE compra_item (
    codigo INT PRIMARY KEY,
  	valor NUMERIC,
    quantidade INTEGER,
    fk_compra_codigo INTEGER REFERENCES compra(codigo),
    fk_produto_codigo INTEGER REFERENCES produto(codigo)
);

CREATE TABLE metodo_pagamento (
    codigo INT PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL
);

CREATE TABLE status_pagamento (
    codigo INT PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL
);

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