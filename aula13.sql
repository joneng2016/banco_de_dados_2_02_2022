DROP DATABASE IF EXISTS transaction_rollback;
# https://meet.jit.si/SenacPortaoADS4P
CREATE DATABASE transaction_rollback;

USE transaction_rollback;

CREATE TABLE musics (
    id_music INTEGER PRIMARY KEY AUTO_INCREMENT,
    name_of_music VARCHAR(255),
    band VARCHAR(255),
    created_at DATETIME DEFAULT NOW()
);

INSERT INTO musics
    (name_of_music, band) 
VALUES 
    ('Nothing Else Matters', 'Metallica'),
    ('Enter Sandman',        'Metallica'),
    ('My Friend of Misery' , 'Metallica'),
    ('Deutshchland',         'Rammstein'),
    ('Rosenrot',             'Rammstein'),
    ('Ohne dich',            'Rammstein'),
    ('La Loto',               'Anitta'   );


SELECT "This Scenario is with Rollback" AS 'LOG';


SELECT "BEFORE DELETE ROW OF musics TABLE" AS 'LOG';

SELECT * FROM musics;

SET autocommit=0;

START TRANSACTION;
    ALTER TABLE musics ADD good BOOLEAN;
     
    UPDATE 
        musics 
    SET 
        good = 1 
    WHERE 
        band IN ('Metallica', 'Rammstein');

    UPDATE 
        musics 
    SET 
        good = 0
    WHERE 
        band = 'Anitta';        

SELECT "AFTER DELETE ROW OF musics TABLE" AS 'LOG';

SELECT * FROM musics;

ROLLBACK;

SELECT * FROM musics;
