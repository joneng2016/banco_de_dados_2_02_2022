USE sakila;


-- SET @ID_CUSTOMER_SELECTED = ();

SELECT @ID_CUSTOMER_SELECTED AS 'ID_CUSTOMER_SELECTED';

SELECT 
    film.title,
    film.description
FROM 
    film 
WHERE 
film_id IN (
    SELECT 
        inventory.film_id 
    FROM 
        inventory
    WHERE
        inventory.inventory_id IN (
            (
                SELECT 
                    rental.inventory_id
                FROM 
                    rental
                WHERE
                    rental.customer_id = (
                        SELECT 
                            customer.customer_id
                        FROM 
                            customer
                        WHERE
                            customer.email = 'KIM.CRUZ@sakilacustomer.org'
                    )
            )
        )
) 


