DROP DATABASE IF EXISTS aula10sh;

CREATE DATABASE aula10sh;

USE aula10sh;

CREATE TABLE carros  (
    id_carro INTEGER PRIMARY KEY AUTO_INCREMENT, 
    nome     VARCHAR(255),
    modelo   VARCHAR(255),
    ano      INTEGER
);

INSERT INTO 
    carros (nome,modelo,ano) 
VALUES 
    ('Chevette',  'Chevrolet',  1995),
    ('Gol'     ,  'Volkswagen', 2010),
    ('Onix'    ,  'Chevrolet',   2020);

SELECT * FROM carros;

CREATE TABLE vendedores  (
    id_vendedor INTEGER PRIMARY KEY AUTO_INCREMENT, 
    nome        VARCHAR(255),
    sobrenome   VARCHAR(255),
    cpf         VARCHAR(255)
);

INSERT INTO 
    vendedores (nome, sobrenome, cpf) 
VALUES 
    ('Jose' , 'Silva', 'xxx.xxx.xxx-xx'),
    ('Fabio' ,'Lima', 'xxx.xxx.xxx-xx');


CREATE TABLE compradores (
    id_comprador    INTEGER PRIMARY KEY AUTO_INCREMENT, 
    nome            VARCHAR(255), 
    sobrenome       VARCHAR(255), 
    cpf             VARCHAR(255)
);

INSERT INTO 
    compradores (nome, sobrenome, cpf) 
VALUES 
    ('Odair' , 'Silva', 'xxx.xxx.xxx-xx');


CREATE TABLE comp_vend_carro (
    id_comp_vend_carro  INTEGER PRIMARY KEY AUTO_INCREMENT, 
    id_comprador        INTEGER,
    FOREIGN KEY (id_comprador) REFERENCES compradores(id_comprador),  
    id_vendedor         INTEGER, 
    FOREIGN KEY (id_vendedor) REFERENCES vendedores(id_vendedor),  
    id_carro            INTEGER,
    FOREIGN KEY (id_carro)    REFERENCES carros(id_carro)  
);


INSERT INTO 
    comp_vend_carro (id_comprador, id_vendedor, id_carro) 
VALUES 
    (
        (SELECT id_comprador FROM compradores WHERE nome = 'Odair'),
        (SELECT id_vendedor  FROM vendedores  WHERE nome = 'Jose'),
        (SELECT id_carro     FROM carros      WHERE nome = 'Gol')                 
    );


/*INSERT INTO 
    comp_vend_carro (id_comprador, id_vendedor, id_carro) 
VALUES 
    (1,1,2);    
*/

CREATE 
    VIEW transaction_cars
as (
    SELECT
        compradores.nome        as comprador,
        compradores.sobrenome   as sobrenome_comprador,
        compradores.cpf         as cpf_comprador,
        vendedores.nome         as vendedor,
        vendedores.sobrenome    as sobrenome_vendedor,
        vendedores.cpf          as cpf_vendedor,
        carros.nome             as nome_carro,
        carros.modelo           as modelo_carro,
        carros.ano              as ano_carro
    FROM
        comp_vend_carro
    INNER JOIN
        compradores 
        ON comp_vend_carro.id_comprador = compradores.id_comprador
    INNER JOIN
        vendedores 
        ON comp_vend_carro.id_vendedor = vendedores.id_vendedor
    INNER JOIN
        carros 
        ON comp_vend_carro.id_carro = carros.id_carro
);    