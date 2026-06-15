DROP DATABASE IF EXISTS controle_estoque;
CREATE DATABASE controle_estoque;
USE controle_estoque;

CREATE TABLE perfil (
    id_perfil INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL UNIQUE,
    descricao VARCHAR(255)
);

CREATE TABLE usuario (
    id_usuario INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_perfil INTEGER NOT NULL,

    CONSTRAINT fk_usuario_perfil FOREIGN KEY (id_perfil)
	REFERENCES perfil(id_perfil)
);

CREATE TABLE produto (
    id_produto INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(120) NOT NULL,
    descricao VARCHAR(255),
    preco DECIMAL(10,2) NOT NULL,
    quantidade_estoque INTEGER NOT NULL DEFAULT 0,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE tipo_movimentacao (
    id_tipo_movimentacao INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(255)
);
CREATE TABLE movimentacao_estoque (
    id_movimentacao_estoque INTEGER PRIMARY KEY AUTO_INCREMENT,
    quantidade INTEGER NOT NULL,
    data_movimentacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    observacao VARCHAR(255),
    id_tipo_movimentacao INTEGER NOT NULL,
    id_produto INTEGER NOT NULL,
    id_usuario INTEGER NOT NULL,

    CONSTRAINT fk_mov_tipo FOREIGN KEY (id_tipo_movimentacao)
	REFERENCES tipo_movimentacao(id_tipo_movimentacao),

    CONSTRAINT fk_mov_produto FOREIGN KEY (id_produto)
	REFERENCES produto(id_produto),

    CONSTRAINT fk_mov_usuario FOREIGN KEY (id_usuario)
	REFERENCES usuario(id_usuario)
);