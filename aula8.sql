DROP DATABASE IF EXISTS leftouter;
CREATE DATABASE leftouter;

USE leftouter;

/*
CRIE UMA TABELA CHAMADA a
CRIE UMA TABELA CHAMADA b
A TABELA a tem as seguintes colunas
id_a
name_a
id_b
A TABELA b tem as seguintes colunas
id_b
name_b
*/

CREATE TABLE b (
    id_b INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name_b VARCHAR(255)
);

CREATE TABLE a (
    id_a INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name_a VARCHAR(255),
    id_b INTEGER,
    FOREIGN KEY (id_b) REFERENCES b(id_b) 
);

/*
Segue os registros de b
'q','w','e','r','t','y','u'
*/

INSERT INTO b (name_b) VALUES
('q'),
('w'),
('e'),
('r'),
('t'),
('y'),
('u');

/*
Segue os registros de a
'a','s','d','f','g','h','j','k','l' tal que:
'q' -> 'a', 's' -> 'r', 'f' -> 't', 'k' -> 'u'
*/

INSERT INTO a (name_a, id_b) VALUES 
('a', (SELECT id_b FROM b WHERE name_b = 'q')),
('s', (SELECT id_b FROM b WHERE name_b = 'r')),
('d', NULL),
('f', (SELECT id_b FROM b WHERE name_b = 't')),
('g', NULL),
('h', NULL),
('j', NULL),
('k', (SELECT id_b FROM b WHERE name_b = 'u')),
('l', NULL);

SELECT
    *
FROM b;

SELECT
    b.id_b
FROM 
    b
INNER JOIN a ON b.id_b = a.id_b; 


SELECT
    *
FROM 
    b 
WHERE
    b.id_b NOT IN (
        SELECT
            b.id_b
        FROM 
            b
        INNER JOIN a ON b.id_b = a.id_b
    );

SELECT "ONLY LEFT" AS "LOG";

SELECT
    *
FROM
    b
LEFT JOIN a ON b.id_b = a.id_b; 

SELECT "WITH OUTER" AS "LOG";

SELECT
    *
FROM
    b
LEFT OUTER JOIN a ON b.id_b = a.id_b; 
