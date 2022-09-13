use sakila;

SELECT 'creating a view' as 'log';

DROP VIEW IF EXISTS select_all_actors; 

CREATE 
    VIEW select_all_actors 
as (
    SELECT 
        actor.first_name,
        actor.last_name,
        actor.last_update 
    FROM 
        actor
    WHERE
        actor.first_name LIKE "C%"
);

SELECT 'using' as 'log';

SELECT * FROM select_all_actors;

