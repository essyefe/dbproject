
CREATE DATABASE ecommerce;

USE ecommerce;

CREATE TABLE TB_CLIENTE (
	CLIENTE_ID INT AUTO_INCREMENT PRIMARY KEY,
	NOME VARCHAR(255),
	EMAIL VARCHAR(255),
	SENHA VARCHAR(100),
	ENDERECO VARCHAR (255),
	TELEFONE VARCHAR (20)
);

CREATE TABLE TB_PEDIDO (
	PEDIDO_ID INT AUTO_INCREMENT PRIMARY KEY,
    CLIENTE_ID INT,
	FOREIGN KEY (CLIENTE_ID) REFERENCES TB_CLIENTE (CLIENTE_ID),
	DATA DATETIME,
	STATUS BOOLEAN
);

CREATE TABLE TB_PAGAMENTOS (
	PAGAMENTO_ID INT AUTO_INCREMENT PRIMARY KEY,
	CLIENTE_ID INT,
	FOREIGN KEY (CLIENTE_ID) REFERENCES TB_CLIENTE (CLIENTE_ID),
	DATA DATETIME,
	VALOR FLOAT,
	METODO ENUM ('Pix', 'Boleto', 'Cartão')
);

CREATE TABLE TB_ENTREGAS (
	ENTREGA_ID INT AUTO_INCREMENT PRIMARY KEY,
	PEDIDO_ID INT,
	FOREIGN KEY (PEDIDO_ID) REFERENCES TB_PEDIDO (PEDIDO_ID),
	DATAENVIO DATETIME,
	DATAENTREGA DATETIME,
	STATUS BOOLEAN
);

CREATE TABLE TB_PRODUTOS (
	PRODUTO_ID INT AUTO_INCREMENT PRIMARY KEY,
	DESCRICAO VARCHAR(255),
	PRECO DECIMAL,
	QUANTIDADE_DISPONIVEL INT,
	CATEGORIA ENUM ('Comida','Derivados','Higiene','Laticinios','Carnes')
);

CREATE TABLE TB_PEDIDO_PRODUTO (
	PEDIDO_ID INT,
	FOREIGN KEY (PEDIDO_ID) REFERENCES TB_PEDIDO (PEDIDO_ID),	
	PRODUTO_ID INT,
	FOREIGN KEY (PRODUTO_ID) REFERENCES TB_PRODUTOS (PRODUTO_ID),
	QUANTIDADE INT,
	OBSERVACAO VARCHAR(255)
);

CREATE TABLE TB_ESTOQUE (
	PRODUTO_ID INT,
	FOREIGN KEY (PRODUTO_ID) REFERENCES TB_PRODUTOS (PRODUTO_ID),
	QUANTIDADE INT
);