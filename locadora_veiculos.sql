CREATE DATABASE locadora_veiculos;
USE locadora_veiculos;

CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf CHAR(14) NOT NULL,
    nascimento DATE NOT NULL,
    UNIQUE (cpf)
);

CREATE TABLE Veiculos (
    id_veiculo INT AUTO_INCREMENT PRIMARY KEY,
    veiculo VARCHAR(255) NOT NULL,
    cor VARCHAR(50) NOT NULL,
    placa CHAR(8) NOT NULL,
    diaria DECIMAL(10, 2) NOT NULL,
    UNIQUE (placa)
);

CREATE TABLE Locacoes (
    id_locacao INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_veiculo INT NOT NULL,
    dias INT NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_veiculo) REFERENCES Veiculos(id_veiculo)
);

-- Populando as tabelas
INSERT INTO Clientes (nome, cpf, nascimento) VALUES
('Ariano Suassuna', '123.456.789-01', '1022-05-21'),
('Grace Hopper', '543.765.987-23', '2002-04-29'),
('Richard Feynman', '987.654.231-90', '2001-10-12'),
('Edgar Poe', '432.762.678-67', '1998-12-14'),
('Gordon Freeman', '927.384.284-44', '1984-11-26');

INSERT INTO Veiculos (veiculo, cor, placa, diaria) VALUES
('Fusca', 'Preto', 'WER-3456', 30.00),
('Variante', 'Rosa', 'FDS-8384', 60.00),
('Comodoro', 'Preto', 'CVB-9933', 20.00),
('Deloriam', 'Azul', 'FGH-2256', 80.00),
('Brasilia', 'Amarela', 'DDI-3948', 45.00);

INSERT INTO Locacoes (id_cliente, id_veiculo, dias, total) VALUES
(1, 1, 3, 90.00),
(2, 2, 7, 420.00),
(3, 3, 1, 20.00),
(4, 4, 3, 240.00),
(5, 5, 7, 315.00);
CREATE VIEW View_Locacoes AS
SELECT 
    L.id_locacao,
    C.nome AS cliente,
    C.cpf,
    V.veiculo,
    V.cor,
    V.placa,
    L.dias,
    L.total
FROM 
    Locacoes L
JOIN 
    Clientes C ON L.id_cliente = C.id_cliente
JOIN 
    Veiculos V ON L.id_veiculo = V.id_veiculo;

-- Consultando a view
SELECT * FROM View_Locacoes;
