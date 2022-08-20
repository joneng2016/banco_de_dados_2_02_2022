SELECT
    *
FROM
    city
WHERE
    city.CountryCode = (
    SELECT 
        Code 
    FROM 
        country 
    WHERE 
        country.Name = 'Afghanistan'
);