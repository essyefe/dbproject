
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
	PRECO FLOAT,
	QUANTIDADE_DISPONIVEL INT,
	CATEGORIA ENUM ('Eletronicos', 'Livros', 'Roupas', 'Calçados', 'Bebidas', 'Alimentos', 'Esportes'),
    NOME VARCHAR (100)
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
	MOVIMENTACAO_ID INT PRIMARY KEY, 
    PRODUTO_ID INT,
    FOREIGN KEY (PRODUTO_ID) REFERENCES TB_PRODUTOS (PRODUTO_ID),
    TIPO_MOVIMENTACAO ENUM ('ENTRADA', 'SAIDA'),
    QUANTIDADE INT,
    DATA_MOVIMENTACAO DATETIME
);

INSERT INTO TB_CLIENTE (NOME, EMAIL, SENHA, ENDERECO, TELEFONE) 
VALUES 
('Arthur', 'arthur@email.com', 'JWb2E*Txhz', 'rua', '(00) 0000-0000'),
('Bruno', 'bruno@email.com', '2MSROGBD@c', 'rua', '(00) 0000-0000'),
('Carlos', 'carlos@email.com', 'U1EynyJAJj', 'rua', '(00) 0000-0000'),
('Daniel', 'daniel@email.com', 'bS5V$AZJ)X', 'rua', '(00) 0000-0000'),
('Eduardo', 'eduardo@email.com', '1rOdF0jzPj', 'rua', '(00) 0000-0000'),
('Felipe', 'felipe@email.com', 'TEmeOCwxgJ', 'rua', '(00) 0000-0000'),
('Gabriel', 'gabriel@email.com', 'JMsb*ZktYQ', 'rua', '(00) 0000-0000'),
('Henrique', 'henrique@email.com', 'wtKnJ!#wb#', 'rua', '(00) 0000-0000'),
('Igor', 'igor@email.com', 'Hoq^5v#XDr', 'rua', '(00) 0000-0000'),
('João', 'joao@email.com', 'ru#N1tWU2S', 'rua', '(00) 0000-0000'),
('Kaio', 'kaio@email.com', 'Vq!0cJ5akZ', 'rua', '(00) 0000-0000'),
('Lucas', 'lucas@email.com', 'gZ(I$Ev%UF', 'rua', '(00) 0000-0000'),
('Matheus', 'matehus@email.com', 'dBCi1cJSSS', 'rua', '(00) 0000-0000'),
('Nicolas', 'nicolas@email.com', '@rCAXLlvO2', 'rua', '(00) 0000-0000'),
('Otavio', 'otavio@email.com', '&EgErEA)wl', 'rua', '(00) 0000-0000'),
('Pedro', 'pedro@email.com', 'Wai*v3iX!S', 'rua', '(00) 0000-0000'),
('Rafael', 'rafael@email.com', '%D#vBnUrEz', 'rua', '(00) 0000-0000'),
('Samuel', 'samuel@email.com', '2T@PEJ()7^', 'rua', '(00) 0000-0000'),
('Thiago', 'thiago@email.com', 'OU2i#BHUoj', 'rua', '(00) 0000-0000'),
('Ulisses', 'ulisses@email.com', 'ubXZJthDy0', 'rua', '(00) 0000-0000'),
('Victor', 'victor@email.com', 'VcezrXhq)x', 'rua', '(00) 0000-0000'),
('Wagner', 'wagner@email.com', 'NUmER)^mdm', 'rua', '(00) 0000-0000'),
('Xavier', 'xavier@email.com', 'Lnd1w#!pyu', 'rua', '(00) 0000-0000'),
('Yuri', 'yuri@email.com', 'LmVFwSp(2R', 'rua', '(00) 0000-0000'),
('Aurora', 'aurora@email.com', 'Yzlsqt#vKD', 'rua', '(00) 0000-0000'),
('Ayla', 'ayla@email.com', 'gQsuF5zl!A', 'rua', '(00) 0000-0000'),
('Bella', 'bella@email.com', '#%3q4z9zaP', 'rua', '(00) 0000-0000'),
('Beatriz', 'beatriz@email.com', 'O*VR7LsCCo', 'rua', '(00) 0000-0000'),
('Chloe', 'chloe@email.com', '9#YTu%dU^J', 'rua', '(00) 0000-0000'),
('Charlotte', 'charlotte@email.com', 'Xvz!sDmu9H', 'rua', '(00) 0000-0000'),
('Camille', 'camille@email.com', 'poWo!TWfa@', 'rua', '(00) 0000-0000'),
('Camila', 'camila@email.com', 'ifmc%wc1jh', 'rua', '(00) 0000-0000'),
('Diana', 'diana@email.com', '&tVB8HhyCe', 'rua', '(00) 0000-0000'),
('Fernanda', 'fernanda@email.com', 'FfCQpKgpim', 'rua', '(00) 0000-0000'),
('Gabriela', 'gabriela@email.com', 'Z&(M6@oMvO', 'rua', '(00) 0000-0000'),
('Isadora', 'isadora@email.com', '@heYYj5U8d', 'rua', '(00) 0000-0000'),
('Julia', 'julia@email.com', 'S7u)FCjo9B', 'rua', '(00) 0000-0000'),
('Helena', 'helena@email.com', ')tzcS$3EqH', 'rua', '(00) 0000-0000'),
('Larissa', 'larissa@email.com', '$LE9$f6^ZS', 'rua', '(00) 0000-0000'),
('Mariana', 'mariana@email.com', '^CqOaHJCBS', 'rua', '(00) 0000-0000'),
('Natalia', 'natalia@email.com', 'b0xrxEAW85', 'rua', '(00) 0000-0000'),
('Renata', 'renata@email.com', 'oz(aE!FJ1M', 'rua', '(00) 0000-0000'),
('Sofia', 'sofia@email.com', 'GQ0iEghysp', 'rua', '(00) 0000-0000'),
('Tatiana', 'tatiana@email.com', '*9(FdrxNcj', 'rua', '(00) 0000-0000');

INSERT INTO TB_PEDIDO ( CLIENTE_ID, DATA, STATUS )
VALUES	
(1, '2024-08-05 14:30:00', FALSE),
(2, '2024-08-05 10:30:00', FALSE),
(1, '2024-08-05 12:30:00', FALSE),
(5, '2024-08-05 17:30:00', FALSE),
(3, '2024-08-05 22:30:00', FALSE),
(7, '2024-08-05 00:30:00', FALSE),
(10, '2024-08-05 04:30:00', FALSE),
(3, '2024-08-05 13:30:00', FALSE),
(2, '2024-08-05 10:30:00', FALSE),
(5, '2024-08-05 05:30:00', FALSE),
(20, '2024-08-05 17:30:00', FALSE),
(6, '2024-08-05 10:30:00', FALSE),
(19, '2024-08-05 07:30:00', FALSE),
(15, '2024-08-05 09:30:00', FALSE),
(12, '2024-08-05 04:30:00', FALSE),
(10, '2024-08-05 14:30:00', FALSE),
(8, '2024-08-05 12:30:00', FALSE),
(3, '2024-08-05 19:30:00', FALSE),
(4, '2024-08-05 20:30:00', FALSE),
(16, '2024-08-05 00:30:00', FALSE),
(21, '2024-08-05 03:30:00', FALSE),
(17, '2024-08-05 02:30:00', FALSE),
(1, '2024-08-05 10:30:00', FALSE),
(18, '2024-08-05 12:30:00', FALSE),
(11, '2024-08-05 01:30:00', FALSE);

INSERT INTO TB_PAGAMENTOS (CLIENTE_ID, DATA, VALOR, METODO)
VALUES
(1, '2024-08-05 14:30:00', 22.22, 'Pix'),
(2, '2024-08-05 10:31:00', 10.00, 'Pix'),
(1, '2024-08-05 12:31:00', 15.00, 'Pix'),
(5, '2024-08-05 17:31:00', 5.00, 'Pix'),
(3, '2024-08-05 22:31:00', 20.00, 'Boleto'),
(7, '2024-08-05 00:31:00', 10.00, 'Pix'),
(10, '2024-08-05 04:31:00', 100.000, 'Pix'),
(3, '2024-08-05 13:31:00', 30.00, 'Pix'),
(2, '2024-08-05 10:31:00', 19.99, 'Pix'),
(5, '2024-08-05 05:31:00', 50.00, 'Pix'),
(20, '2024-08-05 17:31:00', 20.00, 'Pix'),
(6, '2024-08-05 10:31:00', 15.00, 'Pix'),
(19, '2024-08-05 07:31:00', 50.00, 'Pix'),
(15, '2024-08-05 09:31:00', 20.00, 'Boleto'),
(12, '2024-08-05 04:31:00', 30.00, 'Pix'),
(10, '2024-08-05 14:30:00', 50.00, 'Pix'),
(8, '2024-08-05 12:30:00', 15.00, 'Pix'),
(3, '2024-08-05 19:30:00', 10.00, 'Pix'),
(4, '2024-08-05 20:30:00', 20.00, 'Pix'),
(16, '2024-08-05 00:30:00', 100.00, 'Pix'),
(21, '2024-08-05 03:30:00', 19.99, 'Cartão'),
(17, '2024-08-05 02:30:00', 15.00, 'Pix'),
(1, '2024-08-05 10:30:00', 10.00, 'Pix'),
(18, '2024-08-05 12:30:00', 50.00, 'Boleto'),
(11, '2024-08-05 01:30:00', 19.99, 'Pix');

INSERT INTO TB_ENTREGAS (PEDIDO_ID, DATAENVIO, DATAENTREGA, STATUS)
VALUES
(1, '2024-08-05 15:30:00', '2024-09-05 15:30:00', TRUE),
(2, '2024-08-05 11:30:00', '2024-09-05 11:30:00', TRUE),
(1, '2024-08-05 13:30:00', '2024-09-05 13:30:00', TRUE),
(5, '2024-08-05 18:30:00', '2024-09-05 18:30:00', TRUE), 
(3, '2024-08-05 23:30:00', '2024-09-05 23:30:00', TRUE),
(7, '2024-08-05 01:30:00', '2024-09-05 01:30:00', TRUE),
(10, '2024-08-05 05:30:00', '2024-09-05 05:30:00', TRUE),
(3, '2024-08-05 14:30:00', '2024-09-05 14:30:00', TRUE),
(2, '2024-08-05 11:30:00', '2024-09-05 11:30:00', TRUE),
(5, '2024-08-05 06:30:00', '2024-09-05 06:30:00', TRUE),
(20, '2024-08-05 18:30:00', '2024-09-05 18:30:00', TRUE),
(6, '2024-08-05 11:30:00', '2024-09-05 11:30:00', TRUE),
(19, '2024-08-05 08:30:00', '2024-09-05 08:30:00', TRUE),
(15, '2024-08-05 10:30:00', '2024-09-05 10:30:00', TRUE),
(12, '2024-08-05 05:30:00', '2024-09-05 05:30:00', TRUE),
(10, '2024-08-05 15:30:00', '2024-09-05 15:30:00', TRUE),
(8, '2024-08-05 13:30:00', '2024-09-05 13:30:00', TRUE),
(3, '2024-08-05 20:30:00', '2024-09-05 20:30:00', TRUE),
(4, '2024-08-05 21:30:00', '2024-09-05 21:30:00', TRUE),
(16, '2024-08-05 01:30:00', '2024-09-05 01:30:00', TRUE),
(21, '2024-08-05 04:30:00', '2024-09-05 04:30:00', TRUE),
(17, '2024-08-05 03:30:00', '2024-09-05 03:30:00', TRUE),
(1, '2024-08-05 11:30:00', '2024-09-05 11:30:00', TRUE),
(18, '2024-08-05 13:30:00', '2024-09-05 13:30:00', TRUE),
(11, '2024-08-05 02:30:00', '2024-08-05 02:30:00', TRUE);

INSERT INTO TB_PRODUTOS (NOME, DESCRICAO, PRECO, QUANTIDADE_DISPONIVEL, CATEGORIA)
VALUES
('Iphone 15 Pro Max', 'Iphone', 3878.99, 50, 'Eletronicos'),
('Iphone 12', 'Iphone', 2699.10, 50, 'Eletronicos'),
('Iphone 13', 'Iphone', 3549.00, 50, 'Eletronicos'),
('Iphone 11', 'Iphone', 1665.15, 50, 'Eletronicos'),
('Iphone XR', 'Iphone', 1669.00, 50, 'Eletronicos'),
('Iphone X', 'Iphone', 900.00, 50, 'Eletronicos'),
('Xiaomi Redmi 12', 'Xiaomi', 1032.99, 50, 'Eletronicos'),
('Xiaomi POCO X6', 'Xiaomi', 3058.10, 50, 'Eletronicos'),
('XiaomiPOCO C65', 'Xiaomi', 3878.99, 50, 'Eletronicos'),
('Xiaomi Redmi 13C', 'Xiaomi', 1095.54, 50, 'Eletronicos'),
('Xiaomi Redmi Note 13', 'Xiaomi', 1700.50, 50, 'Eletronicos'),
('Samsung Galaxy A25', 'Samsung Galaxy', 1420.00, 50, 'Eletronicos'),
('Samsung Galaxy A15', 'Samsung Galaxy', 911.00, 50, 'Eletronicos'),
('Samsung Galaxy A35', 'Samsung Galaxy', 1650.00, 50, 'Eletronicos'),
('Samsung Galaxy S23', 'Samsung Galaxy', 2250.00, 50, 'Eletronicos'),
('Samsung Galaxy M55', 'Samsung Galaxy', 1800.00, 50, 'Eletronicos');

INSERT INTO TB_PEDIDO_PRODUTO (PEDIDO_ID, PRODUTO_ID, QUANTIDADE, OBSERVACAO)
VALUES
(1, 5, 1, 'Iphone XR'),
(2, 3, 1, 'Iphone 13'),
(1, 7, 1, 'Xiaomi Redmi 12'),
(5, 16, 1, 'Samsung Galaxy M55'),
(3, 3, 1, 'Iphone 13'),
(7, 1, 1, 'Iphone 15 Pro Max'),
(10, 7, 1, 'Xiaomi Redmi 12'),
(3, 8, 1, 'Xiaomi POCO X6'),
(2, 1, 1, 'Iphone XR'),
(5, 6, 1, 'Iphone X'),
(20, 3, 1, 'Iphone 13'),
(6, 9, 1, 'Xiaomi POCO C65'),
(19, 10, 1, 'Xiaomi Redmi 13C'),
(15, 6, 1, 'Iphone X'),
(12, 2, 1, 'Iphone 12');

INSERT INTO TB_ESTOQUE(MOVIMENTACAO_ID, PRODUTO_ID, TIPO_MOVIMENTACAO, QUANTIDADE, DATA_MOVIMENTACAO)
VALUES
(1, 5, 'SAIDA', 1, '2024-09-05 15:30:00'),
(2, 3, 'SAIDA', 1, '2024-08-05 11:30:00'),
(3, 7, 'SAIDA', 1, '2024-08-05 13:30:00'),
(4, 16, 'SAIDA', 1, '2024-08-05 18:30:00'),
(5, 3, 'SAIDA', 1, '2024-08-05 23:30:00'),
(6, 1, 'SAIDA', 1, '2024-08-05 01:30:00'),
(7, 7, 'SAIDA', 1, '2024-08-05 05:30:00'),
(8, 8, 'SAIDA', 1, '2024-08-05 14:30:00'),
(9, 1, 'SAIDA', 1, '2024-08-05 11:30:00'),
(10, 6, 'SAIDA', 1, '2024-08-05 06:30:00'),
(11, 3, 'SAIDA', 1, '2024-08-05 18:30:00'),
(12, 9, 'SAIDA', 1, '2024-08-05 11:30:00'),
(13, 10, 'SAIDA', 1, '2024-08-05 08:30:00'),
(14, 6, 'SAIDA', 1, '2024-08-05 10:30:00'),
(15, 2, 'SAIDA', 1, '2024-08-05 05:30:00');
