/*1 - Mostar cuanto ha ganado el videoclub en el año 1995.*/
SELECT SUM(movies.price) AS total_earnings
FROM movies
JOIN rentings  ON movies.id = rentings.movie_id
WHERE movies.year = 1995;

/*2 - Mostrar las películas que están actualmente alquiladas.*/
SELECT movies.name
FROM rentings
JOIN movies ON rentings.movie_id = movies.id
WHERE dateln IS NULL;

/*3 - Mostrar la lista de películas y las veces que han sido alquiladas ordenada
descendientemente por este último dato.*/
SELECT movies.name, COUNT(rentings.id) AS times_rented
FROM movies
JOIN rentings ON movies.id = rentings.movie_id AND rentings.dateln IS NOT NULL
GROUP BY movies.name ORDER BY times_rented DESC;

/*4 - Mostrar el nombre y el número de teléfono de los socios que tienen películas en su casa.*/
SELECT members.name, members.phone
FROM members
JOIN rentings ON members.id = rentings.member_id
WHERE rentings.dateln IS NULL;

/*5 - ¿Cuánto dinero ha gastado “Teresa Sánchez Sanz” en el videoclub?*/
SELECT SUM(movies.price) AS amount_spent
FROM members
JOIN rentings ON members.id = rentings.member_id
JOIN movies ON members.id = movies.id
WHERE members.name = 'Teresa Sánchez Sanz';

/*6 - Los nombres y códigos de socios que han alquilado películas de suspense o acción
ordenados por código de socio.*/
SELECT DISTINCT members.name, members.DNI
FROM members
JOIN rentings ON members.id = rentings.member_id
JOIN movies ON rentings.movie_id = movies.id
WHERE movies.genre IN ('Suspense', 'Acción')
ORDER BY members.DNI;

/*7 - El nombre y código de socio junto con el dinero total gastado de aquellos socios que han
gastado más de 5 euros en el videoclub.*/
SELECT members.name, members.DNI, SUM(movies.price) AS total_amount_spent
FROM members
JOIN rentings  ON members.id = rentings.member_id
JOIN movies    ON members.id =  movies.id
GROUP BY members.name, members.DNI
HAVING total_amount_spent > 5;

/*8 - Mostrar las fechas en que ha sido alquilada la película “Desperado”.*/
SELECT dateOut
FROM rentings
JOIN movies ON rentings.movie_id = movies.id
WHERE movies.name = 'Desperado';

/*9 - Mostrar la lista de películas que han alquilado el socio con DNI 45777777G.*/
SELECT movies.name 
FROM members
JOIN  rentings ON members.id=rentings.member_id
JOIN  movies ON   rentings.movie_id=movies.id
WHERE members.DNI='45777777G';

/*10 - ¿Cuál es la película española más alquilada? */
SELECT movies.name COUNT(*) 
FROM movies
JOIN renting ON movies.id = renting.movie_id
WHERE movies.country = 'España'
GROUP BY movies.name
LIMIT 1;
