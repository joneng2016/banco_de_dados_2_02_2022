DROP INDEX IF EXISTS idx_customer;
CREATE INDEX idx_customer ON customer(email);

EXPLAIN SELECT
    film.title
FROM
    customer
    INNER JOIN rental ON
        customer.customer_id = rental.customer_id
    INNER JOIN inventory ON
        inventory.inventory_id = rental.inventory_id
    INNER JOIN film ON
        film.film_id = inventory.film_id
WHERE
    customer.email = 'JENNIFER.DAVIS@sakilacustomer.org';

DROP INDEX IF EXISTS idx_film_title;
CREATE INDEX idx_film_title ON film(title);


EXPLAIN SELECT
    film.title
FROM
    customer
    INNER JOIN rental ON
        customer.customer_id = rental.customer_id
    INNER JOIN inventory ON
        inventory.inventory_id = rental.inventory_id
    INNER JOIN film ON
        film.film_id = inventory.film_id
WHERE
    customer.email = 'JENNIFER.DAVIS@sakilacustomer.org';